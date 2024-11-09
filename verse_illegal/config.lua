Config={}

Config.KarpuzToplama = { -- Karpuzların Çıkacağı Konumlar
vec3(2918.5, 777.1, 25.04),
vec3(2916.36, 777.9, 25.01),
vec3(2915.14, 778.7, 25.01),
vec3(2914.31, 780.99, 25.08),
vec3(2913.48, 779.75, 24.92)

}

Config.PortakalToplama = { -- Çilek Toplama Çileklerin Çıkacağı Konumlar
vec3(1089.96, -3194.91, -38.99),
vec3(1092.17, -3194.92, -38.99),
vec3(1094.1, -3194.83, -38.99),
vec3(1095.35, -3194.83, -38.99),
}
-- Config.MandalinToplama = { -- Mandalinlerin Çıkacağı Konumlar
--        vector3(209.87, 6496.77, 31.43),
--        vector3(201.53, 6496.76, 31.47),
--        vector3(208.52, 6509.29, 31.47)
-- }

-- Config.BalToplama = { -- Balların Çıkacağı Konumlar
-- vec3(1992.74, 4810.08, 42.57),
-- vec3(1989.42, 4813.55, 42.93),
-- vec3(1986.57, 4813.01, 43.05),
-- vec3(1990.05, 4809.45, 42.73),
-- vec3(1972.67, 4827.0, 43.65),
-- vec3(1969.82, 4830.23, 43.73),
-- vec3(1970.42, 4832.9, 43.88),
-- vec3(1974.14, 4829.16, 43.7)
-- }
-- Mesleklerin Temelleri
Config.MeslekislemeMiktar = 1 -- Mesleklerde malzeme işlemek için minimum gereken miktar
Config.MeslekMin = 1  -- Mesleklerde toplarken minimum vereceği sayı
Config.MeslekMax = 2 -- Mesleklerde toplarken maximum vereceği sayı
Config.markerboyutu = 0.5 -- Marker Boyutu
Config.xdblipac = true --Blip açıp kapatma (true/false)
Config.MesleksatisMiktar = 1 -- Meslek malzemeleri satarken minimum satılan miktar
Config.MeslekOdeme = "karapara" -- Karpuz satılınca karapara itemi verilsin

--Ot Mesleği
Config.xdKokoIsleme = vec3(1399.16, 3607.25, 38.94)-- Karpuz işleme kordinatı
Config.xdKokoSatis = vec3(56.31, 3689.45, 39.92)-- Karpuz satış kordinatı
--Config.KarpuzToplamaBlip = vec3(-85.43, 1909.67, 196.73) 
--Config.KarpuzToplamaBlipAd = "Ot Toplama Bölgesi"
--Config.KarpuzIslemeBlip = vec3(1398.66, 3607.21, 38.94)
--Config.KarpuzIslemeBlipAd = "Ot Paketleme Bölgesi"
--Config.KarpuzSatisBlip = vector3(148.66, 1667.7, 228.81)
--Config.KarpuzSatisBlipAd = ""
Config.KarpuzFiyat = 12000 -- Karpuz satış fiyatı
Config.OtSatisNPC = vec4(56.31, 3689.45, 39.92, 328.74) --Satış NPC'sinin konumu
Config.OtIslemeNPC = vec4(1399.16, 3607.25, 38.94, 110.29) --İsleme NPC'sinin konumu

--Üzüm Mesleği ama portakal yazan
Config.xdMethIsleme = vector3(1102.6, -3194.73, -38.99) -- Portakal işleme kordinatı
Config.xdMethSatis = vec3(1538.22, 1702.26, 109.67) -- Portakal satış kordinatı
--Config.PortakalToplamaBlip = vec3(1928.05, 4806.84, 44.09) -- Portakal toplama bölgesi için blip
--Config.PortakalToplamaBlipAd = "Üzüm Toplama" -- Portakal toplama bölgesi için blip adı
--Config.PortakalIslemeBlip = vec3(-1513.69, 1523.83, 111.62) -- Portakal işleme bölgesi için blip
--Config.PortakalIslemeBlipAd = "Üzüm İşleme" -- Portakal işleme bölgesi için blip adı
-- Config.PortakalSatisBlip = vec3(1222.65, -3029.93, 5.87) -- Portakal satış bölgesi için blip
--Config.PortakalSatisBlipAd = ""
Config.PortakalFiyat = 8000 -- Portakal satış fiyatı
Config.MethSatisNPC = vec4(1538.22, 1702.26, 109.67, 82.72) --Satış NPC'sinin konumu
Config.MethIslemeNPC = vec4(1102.56, -3194.67, -38.99, 94.93) --İşleme NPC'sinin konumu

-- --Mandalin Mesleği
-- Config.xdMandalinIsleme = vector3(291.67, 6511.51, 29.77) -- Mandalin işleme kordinatı
-- Config.xdMandalinSatis = vector3(291.8, 6524.24, 29.77) -- Mandalin satış kordinatı
-- Config.MandalinToplamaBlip = vector3(201.53, 6496.76, 31.47) -- Mandalin toplama bölgesi için blip
-- Config.MandalinToplamaBlipAd = "Mandalin Toplama" -- Mandalin toplama bölgesi için blip adı
-- Config.MandalinIslemeBlip = vector3(291.8, 6524.24, 29.77) -- Mandalin işleme bölgesi için blip
-- Config.MandalinIslemeBlipAd = "Mandalin İşleme" -- Mandalin işleme bölgesi için blip adı
-- Config.MandalinSatisBlip = vector3(291.8, 6524.24, 29.77) -- Mandalin satış bölgesi için blip
-- Config.MandalinSatisBlipAd = "Mandalin Satış"
-- Config.MandalinFiyat = 350 -- Mandalin satış fiyatı
-- Config.MandalinSatisNPC = vector4(291.8, 6524.24, 29.77, 96.1) --Satış NPC'sinin konumu
-- Config.MandalinIslemeNPC = vector4(291.67, 6511.51, 29.77, 98.29) --İşleme NPC'sinin konumu

--ÇİLEK MESLEĞİ AMA BAL YAZILI
-- Config.xdBalIsleme = vec3(749.93, 4184.12, 41.09) -- Bal işleme kordinatı
-- Config.xdBalSatis = vec3(-1045.15, 5327.81, 44.62) -- Bal satış kordinatı
-- Config.BalToplamaBlip = vec3(1992.74, 4810.08, 42.57)-- Bal toplama bölgesi için blip
-- Config.BalToplamaBlipAd = "Çilek Toplama" -- Bal toplama bölgesi için blip adı
-- Config.BalIslemeBlip = vec3(749.93, 4184.12, 41.09) -- Bal işleme bölgesi için blip
-- Config.BalIslemeBlipAd = "Çilek İşleme" -- Bal işleme bölgesi için blip adı
-- Config.BalSatisBlip = vec3(-1045.15, 5327.81, 44.62) -- Bal satış bölgesi için blip
-- Config.BalSatisBlipAd = "Çilek Satış"
-- Config.BalFiyat = 2500 -- Bal satış fiyatı
-- Config.BalSatisNPC = vec4(-1045.15, 5327.81, 44.62, 38.63) --Satış NPC'sinin konumu
-- Config.BalIslemeNPC = vec4(749.93, 4184.12, 41.09, 67.93) --İşleme NPC'sinin konumu


Config.baliksatis = vector3(1541.56, 6335.54, 24.08)
Config.kaplumbagasatis = vector3(2435.21, 4966.82, 42.35)
Config.balikksatis = vector3(-1844.7, -1198.71, 19.19)
Config.kaplumbaFiyat = 5000
Config.balikFiyat = 10000
Config.balikkFiyat = 1500

Config.Blips = {

}
