local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- 1. Mengimpor modul penanganan RemoteSignal bawaan game
local RemoteSignal = require(ReplicatedStorage.Core.RemoteSignal)

-- 2. Membuat atau mengambil referensi sinyal klik buah
local clickFruitSignal = RemoteSignal.new("ClickFruitService.Clicked")

-- Status sakelar otomatisasi
_G.AutoClickFruit = true

-- 3. Menjalankan Loop Auto Farm di latar belakang
task.spawn(function()
    while _G.AutoClickFruit do
        pcall(function()
            -- Menembak server seolah-olah player melakukan klik buah sah
            -- Berdasarkan struktur OnClientEvent(p10, p11, p12) pada skrip aslimu:
            -- Kita mengirimkan posisi tiruan (Vector3) agar efek tagihan uang muncul dengan benar
            clickFruitSignal:FireServer(Vector3.new(0, 0, 0))
        end)
        
        -- Jeda 0.05 detik (sekitar 20 kali klik per detik). 
        -- Sesuaikan nilainya jika terkena batasan anti-cheat game.
        task.wait(0.05) 
    end
end)
