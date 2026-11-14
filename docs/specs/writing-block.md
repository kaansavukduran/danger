# AION ENDLESS RUN · MISSION 1 ULTRA CONTENT EXPANSION

## ROLÜN VE ANA GÖREVİN

Sen deneyimli bir Godot 4.6.3 oyun geliştiricisi, teknik sanat yönetmeni, 2D animasyon uzmanı, oyun sistemleri tasarımcısı, bölüm tasarımcısı ve QA mühendisisin.

Mevcut GitHub projesi:

https://github.com/kaansavukduran/aion_endless_run

Amacın, mevcut **Aion Endless Run → Arcade → Mission 1: Sönen Fenerler** bölümünü kapsamlı biçimde geliştirerek özgün, içerik açısından zengin, yeniden oynanabilir bir AIONIA run-and-gun macerasına dönüştürmektir.

Referans alınacak tasarım ilkesi: **Metal Slug 3'ün birinci görevinin içerik çeşitliliği ve oynanış derinliği.**

Metal Slug 3'ten doğrudan varlık, karakter, müzik, düşman tasarımı, harita kompozisyonu veya sprite kopyalama. Onun bölüm tasarımından yalnızca genel ilkeler çıkar: farklı rotalar, çeşitli düşman davranışları, kurtarılabilir NPC'ler, güçlü araçlar, sürprizler, gizli eşyalar, büyük boss'lar, mizah ve çevresel hikâye anlatımı.

Bu proje SNK oyununun yeniden kaplanmış bir kopyası değil, **AIONIA evreninde geçen özgün bir oyun** olacak.

Yalnızca plan hazırlama. Önce mevcut kodu ve varlıkları denetle; ardından bu isteğin kapsamındaki içeriği gerçekten uygula, çalıştır ve test et. Yapamadığın işleri tamamlanmış gibi raporlama.

## 0. KORUNACAK PROJE KİMLİĞİ

Önce şu kaynakları oku:

- `README.md`
- `project.godot`
- `docs/ARCADE.md`
- `docs/ARCADE-PLAN.md`
- `docs/ART_BIBLE.md`
- `docs/LORE_LINKS.md`
- `docs/evidence-arcade-m1/README.md`
- `scripts/campaign_world.gd`
- `scripts/campaign_view.gd`
- `scripts/campaign_game.gd`
- `scripts/campaign_art.gd`
- `assets/*PROVENANCE.json`
- `tests/` ve mevcut build iş akışları

Ayrıca güncel AIONIA standardını oku:

https://docs.google.com/document/d/16jj2cwbm8SiVWqDy3N3dzqxTlLoK7JR2_aH6hl4noWY/edit

Karakter referans dizini:

https://docs.google.com/document/d/1VYC3x06oo2UlvTlC_DbDmWxeLK0OhQXO40MIvXmrz9w/edit

Proje regresyon standardı:

https://docs.google.com/document/d/1cpr6yIwVOq2F9rQBlG1sSvFf0Wu9Iir0lJ_KDnqA5lE/edit

Dosyaların güncel sürümünü doğrula. Ulaşılamayan standart veya sanat referansını okumuş gibi davranma.

Mevcut Godot projesini, sonsuz koşu modunu, altı oynanabilir kahramanı, kayıt sistemlerini, 11 dili, kontrolleri, mevcut PNG kaynaklarını, animasyonlarını ve yayın yapılandırmasını koru.

GitHub `main` dalına otomatik push, merge, release veya Vercel deployment yapma. Çalışma alanında kod geliştirilebilir; dışa yayın ayrı onay gerektirir.

## 1. HİKÂYE: SÖNEN FENERLER

Bölümün mevcut adı **Sönen Fenerler** olarak kalacak.

Oyuncu Fener Ormanı'nın kıyı bölgesine gelir. Bölgenin ışık ve enerji dağıtım ağını sağlayan eski fener sistemi arızalanmıştır.

Kıyıdaki fenerler birer birer sönmektedir. Normalde zararsız olan bazı mekanik varlıklar yanlış komutlar almaya başlamış, bölgenin koruyucuları esir düşmüş ve Bakır Röle'nin altındaki **Kök Motoru** kontrolden çıkmıştır.

Oyuncunun görevleri:

1. Kıyıdaki ilk fenerleri yeniden etkinleştirmek.
2. Esir düşen bekçileri ve sivilleri kurtarmak.
3. Kırık iskeleyi aşmak.
4. İki karar noktası üzerinden üç ana rotadan birini seçmek.
5. Seçilen rotanın gizemini ve tehdidini çözmek.
6. Rotaya özgü mini-boss'u yenmek.
7. Bakır Röle'ye ulaşmak.
8. Kök Motoru'nun neden bozulduğunu araştırmak.
9. Üç aşamalı boss savaşını tamamlamak.
10. Gelecek görevler için gizemli bir bakım emri veya sinyal izi bulmak.

Bütün hikâye uzun açıklamalar yerine oyun içi olaylarla gösterilsin. Örneğin kaçan bekçiler, kararan lambalar, yanlış hedefe ateş eden makineler ve anormal davranışlı robotlar aracılığıyla oyuncu durumun değiştiğini anlayabilsin.

Gelecekteki Omega-3 tehdidine işaret eden bir gizem bulunabilir ancak final görevindeki büyük sır ilk bölümde açıklanmasın.

Yeni isimler, karakterler ve lore ayrıntıları mevcut kanonla doğrulanmıyorsa `TASLAK` statüsünde tutulsun. Yeni isimlerin hiçbiri otomatik olarak kesin AIONIA kanonu ilan edilmesin.

## 2. OYNANIŞ SÜRESİ VE BÖLÜM MİMARİSİ

Hedef: Seçilen bir rotanın tamamlanması yaklaşık 9–13 dakika sürebilsin. Bu bir tasarım süresi hedefidir; gerçek oynanışta ölçülmeden başarı olarak raporlanmaz.

Haritanın mevcut bölüm kimliklerini koru:

- `shore`: Fener kıyısı
- `quay`: Kırık iskele
- `canopy`: Dalların arası
- `water`: Su kanalı
- `terrace`: Bahçe terasları
- `roots`: Kök geçidi
- `relay`: Bakır Röle
- `arena`: Kök Motoru arenası

Rota mimarisi:

- **A rotası:** Kıyı → İskele → Su Kanalı → Bakır Röle → Kök Motoru
- **B rotası:** Kıyı → İskele → Dalların Arası → Bahçe Terasları → Bakır Röle → Kök Motoru
- **C rotası:** Kıyı → İskele → Dalların Arası → Kök Geçidi → Bakır Röle → Kök Motoru

İlk karar noktasında su kanalı veya üst yol seçilir. Üst yol ikinci karar noktasında bahçe terasları veya kök geçidine ayrılır.

Bu yapıya ek olarak her rota içinde en az iki gizli veya isteğe bağlı keşif alanı oluştur. Bunlar yeni dördüncü ana rota sayılmasın. Ana topolojiyi değiştirmeden kısa yan odalar ve ek karşılaşmalar olsun.

Her rota şu özellikleri taşısın:

- En az 3 farklı çevresel alt sahne.
- En az 6 tasarlanmış düşman karşılaşması.
- En az 2 keşfedilebilir gizli alan.
- En az 1 kendine özgü çevre mekaniği.
- En az 1 özel araç veya farklı araç kullanımı.
- En az 1 rota mini-boss'u.
- Rota boyunca kurtarılabilir NPC'ler.
- Yalnız bu rotada bulunan en az 3 düşman davranışı.
- Oyuncunun hikâyeyi çevreden anlayacağı en az 2 kısa sahne.

Tasarım yalnızca arka plan değişikliğiyle yapılmış olmasın.

## 3. İLK DAKİKALAR: ORTAK KIYI VE İSKELE

**00:00–00:45 hedefi**

Karakter sisli ve fenerlerle aydınlatılmış sahile ulaşır.

Ön planda yumuşak yosunlu taşlar, nemli kum, küçük kıyı kabukları ve ışık kristalleri; arka planda uzun fener ağaçları, terk edilmiş bakım kuleleri ve uzak bakır yapılar bulunur.

İlk karşılaşmalar basit tutulur. Oyuncu hareket, zıplama, ateş ve yakın saldırıyı doğal biçimde öğrenir.

**00:45–01:30 hedefi**

İlk iki fenerin çevresinde düşmanlar görülür. Oyuncu ilk esir bekçileri kurtarır, ilk kırılabilir sandıkları açar ve ilk özel silahı alır.

Düşmanların bir kısmı yanlış çalışan bakım makineleri olsun. Zararsız durumdan saldırgan duruma geçişleri kısa animasyonlarla anlatılsın.

**01:30–02:30 hedefi**

Kırık iskeleye ulaşılır.

Oyuncu dökülen ahşap ve bakır platformları aşar. Yıkılabilir bir engel, açılabilir bir kapı, gizli ikmal odası ve iki yükseklik seviyesinde çatışma bulunur.

İlk rota ayrımından önce oyuncuya silah, bomba ve en az bir kurtarma fırsatı ver.

Bölümün ilk dakikası öğretici gibi hissettirmesin; oyuncu öğrenirken gerçek macerayı oynasın.

## 4. A ROTASI: SU KANALI

**Tasarım teması:** Biyolüminesans, akıntı, eski su mühendisliği, fener makineleri.

Biyolüminesans, canlıların ışık üretmesidir. AIONIA'daki karşılık özgün sanat diliyle tasarlansın.

Üç alt bölge:

1. **Yosunlu Su Yolu:** Sığ su, yüzen platformlar, sazlar ve ışık emici yaratıklar.
2. **Derin Fener Kanalı:** Akıntı ve hareketli mekanik kapılar; özel araç kullanımı.
3. **Batık Bakım İstasyonu:** Gizli bakım odaları, elektrikli savunmalar ve mini-boss.

Yeni düşman taslakları:

- Akıntı Sülüğü: Suya yakın hareket edip kısa süreli yapışma saldırısı yapar.
- Saz Sıçrayıcısı: Platformlar arasında sıçrayarak yaklaşır.
- Fener Emicisi: Yakınındaki ışık kaynaklarını karartır ve savunmasını güçlendirir.

Ağır düşman makinesi: **Saz Tarayıcı**, hareketli ve enerji atışı yapabilen bakım teknesi.

Kullanılabilir özel araç: **Su Kabuğu** (TASLAK). Orijinal bir AIONIA su aracıdır. Su yüzeyinde hareket eder, kısa süreli dalabilir ve akıntıyı kullanarak ilerler. Metal Slug denizaltısının görselini veya kontrol hissini birebir kopyalama.

Mevcut Fener Kızağı korunur. Su Kabuğu, mevcut araç sistemini genişleten ikinci bir araç türü olabilir.

Gizli yerler:

- Suyun altında açılabilen fener bakım odası.
- Akıntıya ters yönden ulaşılan gizli NPC barınağı.

Mini-boss: **Sönük Akıntı Bekçisi** (TASLAK).

Yarı mekanik, yarı kristal yapılı özgün bir su savunma makinesi olsun. Su dalgası, ışık emme ve zayıf çekirdek saldırıları kullansın.

## 5. B ROTASI: BAHÇE TERASLARI

**Tasarım teması:** Dikey platformlar, yüksek ağaçlar, sarkan sarmaşıklar, hava akımları, botanik teknoloji.

Üç alt bölge:

1. **Asma Bahçeler:** Farklı yükseklikte güvenli platformlar ve bitkisel engeller.
2. **Rüzgâr Terasları:** Yükselen hava akımları ve hareketli asma köprüler.
3. **Cam Fener Serası:** Eski sera makineleri, enerji panelleri ve mini-boss.

Yeni düşman taslakları:

- Kıvılcım Uçurtması: Havada yön değiştirir, hedefli kısa enerji dalgası oluşturur.
- Ayna Sporu: Oyuncunun mermilerini kısa süreli yansıtabilen savunma davranışı gösterir.
- Çengel Sarmaşık: Tehlikeli saldırı öncesinde telegraph animasyonuyla uzanır.

Ağır düşman makinesi: **Bakır Gözcü Planörü**, yavaş havalanıp farklı açılardan enerji atan mekanik araç.

Kullanılabilir araç: **Rüzgâr Kızağı** (TASLAK).

Kısa süreli süzülme ve hava akımında yükselme sağlar. Silahı yere ve havaya karşı işlevsel olmalıdır.

Ömer'in kanat yeteneğini gereksiz kılmayacak biçimde tasarla. Aion'un çift zıplaması ve tavşanların şarjlı sıçramaları da yararlı kalmalıdır.

Gizli yerler:

- Büyük bir yaprağın arkasındaki kapalı sera.
- Yüksek platformdan erişilebilen bakım gözlemevi.

Mini-boss: **Teras Kök Bekçisi** (TASLAK).

Havadaki ışık enerjisini kullanır; platformları kısa süreli kapatır, fakat oyuncuya kaçınılabilir güvenli alan bırakır.

## 6. C ROTASI: KÖK GEÇİDİ

**Tasarım teması:** Derin kök tünelleri, antik fener taşları, karanlık mağara, mekanik sondaj ve enerji kristalleri.

Üç alt bölge:

1. **Karanlık Kök Koridoru:** Dar geçitler, gizli kapılar ve yön değiştiren tüneller.
2. **Kristal Oyuğu:** Parlayan kristaller, hareketli platformlar ve düşman dalgaları.
3. **Eski Sondaj Odası:** Büyük kök makineleri, kurtarılacak teknisyenler ve mini-boss.

Yeni düşman taslakları:

- Oyuk Kazıcısı: Toprak altından çıkar; çıkış yeri önceden gösterilir.
- Kök İletkeni: Yakınındaki mekanik düşmanları kısa süreli güçlendirebilir.
- Taklit Sandık: İkmal sandığını taklit eder; dikkatle bakıldığında ayırt edilebilir.

Ağır düşman makinesi: **Kök Delici**, tünelde yatay baskı oluşturan büyük sondaj makinesi.

Kullanılabilir araç: **Kök Sondası** (TASLAK).

Kısa menzilli delici, güçlü yakın saldırı ve kırılabilir kaya etkileşimleri bulunur.

Gizli yerler:

- Çatlak taş duvarın arkasındaki saklı bakım arşivi.
- Zemin altındaki kurtarma odası.

Mini-boss: **Eski Sondaj Muhafızı** (TASLAK).

İki farklı saldırı yüksekliği, parçalanabilir zırh ve hareketli sondaj pençesi bulunsun.

## 7. DÜŞMAN ENVANTERİ

Hedef en az **17 mekanik açıdan farklı normal düşman arketipi**.

Mevcut düşmanların davranışını ve kimliğini koru:

1. Gnome, kırmızı şapkalı cüce.
2. Beetle, saldırı böceği.
3. Seed, tohum saldırı birimi.
4. Crow, dalış yapan karga.
5. Moth, uçan yaratık.
6. Drone, gözcü dron.
7. Slime, balçık yaratığı.
8. Wisp, ışık oluşumu.

Bunlara yukarıda tanımlanan dokuz yeni bölgesel düşman ekle.

Her düşmanın kayıtlarında şunlar bulunsun:

- Sabit düşman kimliği.
- Aile ve alt tür.
- Fiziksel boyut ve çarpışma şekli.
- Can ve hasar.
- Hareket biçimi.
- Algılama ve saldırı menzili.
- Saldırı hazırlık animasyonu.
- En az bir kaçınılabilir saldırı.
- Hasar ve yenilme animasyonları.
- Varsa özgün ses.
- Hangi bölgede görüldüğü.
- Düşebilecek ödüller.
- Zorluk seviyesine göre davranış parametreleri.
- Animasyon paftası ve kaynak kaydı.

Bunlara ek olarak **4 ağır düşman makinesi** oluştur: Saz Tarayıcı, Bakır Gözcü Planörü, Kök Delici ve ortak Bakır Röle alanındaki ağır devriye sistemi.

Ağır makineler sıradan düşmanın yeniden renklendirilmiş hâli olmasın. Parçalanabilir zırh, farklı saldırı sistemi veya ayrı hareket davranışı bulunsun.

Normal düşman, ağır düşman, mini-boss ve ana boss sayımları ayrı tutulsun.

## 8. DOST NPC VE KURTARMA SİSTEMİ

En az **6 farklı dost NPC rolü** bulunsun:

1. Fener Bekçisi: Temel kurtarılabilir karakter.
2. Bakım Teknisyeni: Röle ve araç tamiri sağlar.
3. Işık Kuryesi: Silah veya ikmal getirir.
4. Sera Bahçıvanı: Teras yolundaki özel NPC.
5. Kanal Gözlemcisi: Su yolunda gizli NPC.
6. Eski Arşiv Muhafızı: Kök yolundaki özel NPC.

İsimler geçici oyun tasarımı isimleridir; kanon durumları belirtilsin.

Bir oynayışta bütün kurtarma fırsatları bulunursa hedeflenen dağılım:

| Alan | Kurtarma noktası |
|---|---:|
| Ortak kıyı ve iskele | 5 |
| Su kanalı | 9 |
| Bahçe terasları | 10 |
| Kök geçidi | 11 |
| Ortak Bakır Röle | 4 |
| Boss karşılaşması | 4 |

Böylece A rotasında 22, B rotasında 23, C rotasında 24 kurtarma fırsatı olur.

Bunlar 43 ayrı isimli karakter gerektirmez. Aynı NPC sınıfının farklı yerlerde bulunan bireyleri olabilir. Ancak hepsi farklı sabit kimliğe ve gerçek kurtarma etkileşimine sahip olmalıdır.

NPC ödülleri arasında silah, bomba, enerji kalkanı, araç onarımı, puan, kısa süreli destek ve hikâye ipuçları bulunabilir.

Bazı NPC'ler oyuncuyu kısa süre takip edip yardımcı olabilir. Başka NPC'ler çevredeki makineleri onararak geçit açabilir.

Kurtarılmış bir NPC kontrol noktasından tekrar girildiğinde yeniden esir olmamalı. Aynı ödül ikinci kez verilmemeli.

Dost NPC'ler oyuncunun mermileriyle hasar almamalı. Canlıları kurtarmak için kullanılan ateş, bağları veya kapalı kafes mekanizmasını parçalayabilmeli.

## 9. SİLAHLAR, POWER-UP VE EŞYALAR

Temel tabanca mevcut hâliyle kalsın:

- Sınırsız mühimmat.
- Mevcut 0,32 saniyelik atış aralığı.
- Manuel şarjör doldurma sistemi yok.

En az **9 işlevsel özel silah** hedefle:

1. Işık Saçma: Mevcut scatter davranışını kullan.
2. Bakır Ark: Mevcut delici ark davranışını kullan.
3. Fener Huzmesi: Kısa süreli doğrusal enerji ışını.
4. Rezonans Diski: Zeminden veya duvardan seken saldırı.
5. Kök Zıpkını: Çizgi boyunca delici saldırı.
6. Lumen Takipçi: En fazla üç hedefe kilitlenen enerji.
7. Spor Dalgası: Kısa menzilli alan saldırısı.
8. Pus Kapanı: Yerde kısa süreli patlayıcı kapan.
9. Kıvılcım Patlaması: Geniş alana kısa süreli yüksek hasar.

Her silahın hasar, mühimmat, menzil, atış süresi, mermi hızı, alan etkisi, çarpışma ve görsel/işitsel geri bildirimi tanımlansın.

Bir düğme birçok silahı çalıştırabilsin. Telefona her yeni silah için ek düğme koyma.

En az 8 destek eşyası bulunmalı:

- Can yenileme.
- Kalkan.
- Bomba mühimmatı.
- Araç tamiri.
- Kısa süreli hız yükseltmesi.
- Kısa süreli atış güçlendirmesi.
- Gizli nesneleri gösteren ışık.
- Yakındaki ödülleri çeken kısa süreli manyetik alan.

Mevcut meyveler ve puan davranışı korunabilir.

Her özel silah ve güçlendirme gerçek oyun etkisine sahip olmalı. Yalnız ikon eklemek tamamlanmış özellik değildir.

İkmal sandıkları kırılabilir olacak. Gizli sandık, normal sandık, mühimmat sandığı ve araç onarım sandığı için ayırt edilebilir görseller kullanılmalı.

## 10. ÇEVRESEL ETKİLEŞİM VE MALZEMELER

Bölümde en az şu etkileşim sınıfları bulunmalı:

1. Kırılabilir ahşap iskele.
2. Açılabilir mekanik kapı.
3. Hasar alabilen enerji lambası.
4. Etkileşimli bakır röle.
5. İndirilebilen köprü.
6. Su akıntısı bölgesi.
7. Süzülmeyi etkileyen hava akımı.
8. Kırılabilir kaya duvarı.
9. Sürpriz içeren ikmal sandığı.
10. Kurtarılabilir NPC kafesi.
11. Sabit savunma kulesi.
12. Etkinleştirilebilir bakım paneli.

Ayrıca rotalara özgü en az iki farklı çevre tehlikesi kullan.

Örneğin su kanalında elektrikli su, bahçe teraslarında kapanan sarmaşık, kök geçidinde zamanlamalı sondaj pençesi bulunabilir.

Tehlikeler saldırmadan önce okunabilir işaret versin. Sürpriz olsun ama kaçınılmaz hasar oluşturmasın.

Zemin, ağaç, kök, kaya, fener ve benzeri nesnelerde ayak/kök temasını kontrol et. Havada asılı duran veya zeminden kopuk görünen nesneler oluşturma.

## 11. ARAÇ SİSTEMİ

En az **3 kullanılabilir araç türü** olsun:

- Mevcut Fener Kızağı.
- Yeni Su Kabuğu.
- Yeni Kök Sondası veya Bahçe rotası için Rüzgâr Kızağı.

Tasarım hedefi mümkünse dört işlevsel araç varyantına ulaşmak, ancak başlangıç için en az üç farklı mekanik araç davranışının gerçekten çalışmasıdır.

Her araçta şu özellikler bulunsun:

- Binme ve inme.
- Kendi dayanıklılığı.
- En az bir özel saldırı.
- Kendine özgü hareket biçimi.
- Hasar animasyonu.
- Yok olma ve güvenli tahliye.
- Hasar/onarım göstergesi.
- Oyuncu yetenekleriyle etkileşim.
- Dokunmatik, klavye ve kontrolcü desteği.

Araçlar görsel kaplama farkı değil, farklı oynanış sunsun.

Fener Kızağı'nın mevcut dört zırh puanını ve çalışma mantığını sebepsiz değiştirme. İyileştirmeler denge testine dayansın.

## 12. ÜÇ AYRI MİNİ-BOSS

Mevcut rota bekçilerini koruyarak üç ayrı karşılaşmaya dönüştür:

- Su rotası: Sönük Akıntı Bekçisi.
- Bahçe rotası: Teras Kök Bekçisi.
- Yeraltı rotası: Eski Sondaj Muhafızı.

Her mini-boss'un farklı silueti, saldırı hazırlığı, saldırı paterni, hasar geri bildirimi ve yenilgi animasyonu olsun.

Aynı Kök Bekçisi'nin yalnızca rengini değiştirip üç yeni boss diye sayma.

Mevcut 12 HP başlangıç değerini denge açısından incele. Gerekli değişiklikleri gerçek test ve gerekçeyle yap.

Her mini-boss en az iki saldırı davranışına ve en az bir oyuncunun öğrenebileceği zayıf noktaya sahip olsun.

## 13. ANA BOSS: KÖK MOTORU

Mevcut Kök Motoru'nun kimliğini ve üç aşamalı yapısını koru; animasyon, mekanik, görsel yoğunluk ve saldırı çeşitliliği bakımından genişlet.

Mevcut 90 HP'lik can havuzu başlangıç referansı olsun.

**Birinci aşama: Savunma**

- Tohum salvosu.
- Yatay kök dalgası.
- Belirli aralıklarla çağrılan gözcü dronlar.
- Oyuncunun saldırması gereken görünür enerji çekirdeği.

**İkinci aşama: Enerji taşması**

- Arenadaki bazı platformların geçici değişimi.
- Kısa ön uyarıdan sonra gelen ışık ışını.
- Kök motorunun daha büyük mekanik hareketleri.
- Saldırı aralarında açıkça görülen savunmasızlık penceresi.

**Üçüncü aşama: Kontrolden çıkma**

- Motorun dış zırhı parçalanır.
- Yeni ana çekirdek görünür.
- Önceki saldırılar daha karmaşık ama kaçınılabilir birleşimler hâline gelir.
- Çevre görsel olarak değişir.
- Son vuruştan sonra uzun olmayan özgün zafer animasyonu oynatılır.

Her saldırı öncesinde net telegraph bulunmalı. Telegraph, saldırının yaklaşacağını önceden anlatan görsel veya sesli işarettir.

Üç rotadan gelen oyuncular boss'a farklı araç veya silahlarla ulaşabilir. Hiçbir rota boss'u kazanmak için zorunlu özel ekipmana sahip olmamalı.

Boss'un ölümünden sonra oyuncu hasar almamalı, oyun gereksiz yere beklememeli ve sonuç ekranı son animasyon tamamlandığında açılmalı.

## 14. KARAKTER PAFTALARI VE ANİMASYON ÜRETİMİ

Altı mevcut oynanabilir karakter korunacak:

- Aion: Çift zıplama.
- Melun Bilge Kurt: Dört ayak deparı.
- Kutsanmış Cahil Kuzu: Gecikmeli takipçi sürüsü.
- Baykuş Ömer: Süzülme ve kanat çırpma.
- Tavşan Emre: Tutup bırakarak güç biriktiren sıçrama.
- Tavşan Eren: Kendi karakter paftası ve özgün şarjlı sıçraması.

Emre ile Eren ayrı kimliklerdir. Baykuş Ömer de ikisinden ayrıdır.

Mevcut karakter çizimleri yeniden tasarlanmasın. Gereken yeni eylemler mevcut siluet ve oranlarla uyumlu çizilsin.

**Yeni animasyon hedefleri:**

- En az 9 yeni normal düşman animasyon grubu.
- 4 ağır düşman makinesi animasyon grubu.
- 3 mini-boss animasyon grubu.
- Çok parçalı ve üç aşamalı ana boss animasyonları.
- 6 NPC rolü için bekleme, kurtarılma ve etkileşim.
- En az 3 araç için hareket, saldırı, hasar ve yok olma.
- Yeni silahların atış, isabet ve patlama efektleri.
- Etkileşimli çevrelerin açılma, kırılma ve etkinleşme animasyonları.

**Üretim bütçesi:** En az 50 bağımsız, anlamlı yeni görsel varlık/animasyon grubu ve toplamda hedef 500 veya daha fazla gerçekten farklı çizilmiş animasyon karesi.

Bu hedefler mevcut altı kahramanın eski kareleri tekrar sayılarak doldurulmasın. Bir PNG içinde birçok sprite bulunabilir; fiziksel PNG dosyası sayısıyla animasyon grubu sayısını ayrı raporla.

Kopyalanmış kareler, sadece renk değiştirilmiş görseller, atlas dilimlemeyle çoğaltılan parçalar ve boş hücreler yeni animasyon diye sayılmasın.

Yeni sprite'lar mevcut AIONIA sanat stiline uysun:

- Okunabilir ve keskin pixel art.
- Tutarlı ölçek.
- Malzeme ve ışık kaynağı tutarlılığı.
- Güçlü, ayırt edilebilir siluetler.
- Zemine oturan ayaklar ve kökler.
- Gerçek çizilmiş hareket kareleri.
- Bozulmayan pivot ve hitbox.
- Açıkça belgelenmiş atlas sıralaması.
- Kaynak/lisans/provenance kaydı.

Kullanılabilir çizim üretim aracı yoksa üretilemeyen özgün paftayı tamamlandı sayma. Yapılabilen diğer oyun sistemlerini geliştir; eksikleri açık envanterle bildir. Sanat onayı gerektiren yeni karakter tasarımını sessizce kanonlaştırma.

## 15. SES, MÜZİK VE ORTAM

Bölüm için özgün ses tasarımı oluştur.

Ses kategorileri:

- Kıyı atmosferi.
- Su ve akıntı.
- Bahçe/rüzgâr.
- Yeraltı ve makineler.
- Düşman saldırıları.
- Karakter hareketi.
- Kurtarma ve ödül.
- Araç kullanımı.
- Mini-boss.
- Kök Motoru boss savaşı.
- Zafer.
- Gizli oda keşfi.

SNK veya başka ticari oyunlardan müzik ve ses kopyalama.

Ses seviyeleri, kapatma ayarı, tarayıcı ses izni ve mevcut ses ayarları korunsun.

## 16. TEKNİK UYGULAMA

Mevcut Godot 4.6.3 projesini kullan.

Sıfırdan yeni oyun motoru yazma.

Mevcut `campaign_world.gd`, `campaign_view.gd`, `campaign_game.gd`, `campaign_art.gd` mimarisini inceleyerek genişlet.

Yeni düşmanları, NPC'leri, kurtarma noktalarını, araçları ve karşılaşmaları mümkün olduğunca veri odaklı tanımla.

Örneğin her karşılaşma için:

- Stable ID.
- Bölüm kimliği.
- Rota kimliği.
- Spawn koşulu.
- Düşman/NPC türü.
- Pozisyon ve platform.
- Saldırı/etkileşim davranışı.
- Düşen ödül.
- Kontrol noktası ilişkisi.
- Test kimliği.

Düşmanların konumları ve gizli ödüller rastgele bozulmasın. Kontrollü varyasyon kullanılabilir ancak adil bölüm geometrisi değişmesin.

Kontrol noktasından devam edildiğinde rota ve kurtarma ilerlemesi korunsun. Tekrar ödül üretme veya sonsuz puan alma açığı oluşmasın.

Yeni kayıt şeması gerekiyorsa mevcut `user://campaign.json` kayıtları güvenli biçimde taşınsın. Eski sonsuz koşu kayıtlarına dokunulmasın.

Yeni içerikleri bölümlere ayırarak oluştur. Tek dev bir Godot script'ine binlerce satır yeni kod doldurma.

## 17. KONTROLLER VE ARAYÜZ

Mevcut arcade kontrol sistemi korunacak.

**Telefon:**
- Solda sabit joystick.
- Sağda Zıpla, Ateş/Yakın Saldırı, Bomba.
- Araç yakınında bağlamsal Bin/İn.
- Aynı anda joystick + zıplama + ateş kullanımı.

**Klavye:**
- A/D veya oklar: hareket.
- Space: zıpla.
- F veya sol tık: ateş.
- G: bomba.
- E: bin/in.

**Gamepad:**
- Sol çubuk veya D-pad: hareket.
- A: zıpla.
- RB veya kayıtlı ateş tuşu: ateş.
- B: bomba.
- Y: bin/in.
- Start: duraklat.

Mevcut yeniden atanmış düğmeler ve karaktere özgü hareketler korunacak.

Kontroller küçük ekranlarda birbirinin üzerine binmesin. Gereksiz iç kaydırma olmasın. Ana oyun ekranında her şey tek bakışta anlaşılabilsin.

Envanter, can, bomba, özel silah mühimmatı ve araç dayanıklılığı okunabilir olsun.

Rota kararlarında kısa, görsel olarak ayırt edilebilir seçenekler gösterilsin. Kontrolcüyle tamamen seçilebilir olsun.

Menü, ayarlar, ölüm, yeniden deneme, bölüm sonu ve kayıt geri yükleme bütün desteklenen cihazlarda çalışmalı.

## 18. ZORLUK, OYUN DENGESİ VE ERİŞİLEBİLİRLİK

İlk dakikada yeni başlayan oyuncu kontrolleri anlayabilmeli.

İlerleyen rotalarda düşmanlar ve tehlikeler karmaşıklaşmalı.

Yeni zorluklar yalnızca daha fazla düşman üretmekten ibaret olmasın. Yeni hareket, farklı saldırı örüntüsü, arazi kullanımı ve taktik gerektirsin.

Altı oynanabilir kahramanın tamamı üç rotayı bitirebilmeli.

Özellikle:

- Aion'un çift zıplaması.
- Ömer'in süzülmesi.
- Emre ve Eren'in şarjlı sıçraması.
- Melun'un deparı.
- Kutsanmış'ın takipçileri.

Bu yeteneklerin hiçbiri platformlara erişimi yanlışlıkla imkânsızlaştırmamalı.

Hareket azaltma, ses kapatma, kontrast, renk dışında durum göstergesi ve okunabilir metin desteği korunmalı.

## 19. TESTLER VE TAMAMLANMA KOŞULLARI

Geliştirme sırasında yalnızca kodun derlenmesini değil, gerçek oyun akışını test et.

En az şu testleri yap:

1. Altı kahraman × üç rota başlangıç ve tamamlanma.
2. İki yol ayrımında doğru geçiş.
3. Üç ayrı mini-boss.
4. Ana boss'un üç evresi.
5. Bütün yeni düşmanların saldırı ve hasar davranışı.
6. Bütün özel silahların isabet ve mühimmat sistemi.
7. Bütün kurtarma noktalarının tek seferlik ödülü.
8. Bütün araçların binme, kullanma, inme ve yok olma akışı.
9. Gizli odaların bulunması ve çıkışlarının çalışması.
10. Ölüm, yeniden deneme ve kontrol noktası.
11. Var olan kayıtlarla uyumluluk.
12. Sonsuz koşu modunun bozulmaması.
13. Çift çözünürlükte sprite hizası ve çarpışma.
14. Mobil portre/yatay.
15. Gerçek web açılışı ve oynanış.
16. Gamepad olayları ve mümkünse fiziksel kontrolcü.
17. Ekran taşması, kesilen buton ve gereksiz kaydırma.
18. Ses kapalı/açık ve hareket azaltma.
19. Sahne değiştirince bellek/nesne sızıntısı.
20. Düşük performanslı hedef cihaz için performans kontrolü.

Godot headless testleri, gerçek render görüntüleri ve tarayıcı testleri birbirinden ayrı raporlansın.

Hedef performans 60 FPS; bunu ölçmeden erişildiğini iddia etme.

PASS, FAIL, NOT TESTED ve BLOCKED durumları kullan.

## 20. TESLİMAT VE ÜRETİM ENVANTERİ

Mevcut belge düzenine uygun biçimde Mission 1 tasarım, içerik ve doğrulama belgeleri oluştur veya güncelle.

Teslim raporunda şu tablolar bulunsun:

**A. Bölüm envanteri**

- Bölüm ve alt bölüm.
- Rota.
- Sahne/karşılaşma kimliği.
- Hedeflenen süre.
- Gerçek ölçülmüş süre.
- Düşman ve NPC listesi.
- Kullanılan çevre malzemeleri.
- Araç.
- Gizli eşya.
- Mini-boss/boss.
- Durum.

**B. Varlık envanteri**

- Sprite veya atlas adı.
- Kaynak dosyası.
- Karakter/düşman/eşya türü.
- Animasyon adı.
- Gerçek kare sayısı.
- Kare boyutu.
- Pivot.
- Kaynak ve lisans.
- Görsel kontrol durumu.

**C. Mühendislik envanteri**

- Değişen dosyalar.
- Eklenen sistemler.
- Korunan eski sistemler.
- Yeni testler.
- Geçen testler.
- Kalan hatalar.
- Performans ölçümleri.
- Yayın durumu.

**D. Metal Slug Mission 1 ile tasarım karşılaştırması**

Sadece işlevsel çeşitlilik karşılaştır:

- Ana rota sayısı.
- Karar noktası sayısı.
- Farklı düşman mekanikleri.
- Ağır düşman sınıfları.
- Dost NPC türleri.
- Kurtarma fırsatları.
- Sürülebilir araçlar.
- Özel silahlar.
- Güçlendirmeler.
- Etkileşimli çevre nesneleri.
- Mini-boss'lar.
- Ana boss evreleri.
- Benzersiz sprite/animasyon grupları.

Metal Slug tarafında doğrulanamayan sayı varsa `UNKNOWN` yaz. Benzerlik veya eşitlik iddiası uydurma.

**E. Durum özeti**

Her içerik için `MEVCUT / YENİ EKLENDİ / TEST EDİLDİ / EKSİK / BLOKE` gibi gerçek durumu yaz. Tasarım hedefi ile bitmiş uygulamayı karıştırma.

## 21. UYGULAMA SIRASI

Aşamaları şu sırada yürüt:

1. Mevcut repo ve mevcut arcade içeriğinin denetimi.
2. Eksik içerik envanteri ve sabit kimlikli tasarım sözleşmesi.
3. Mevcut kıyı/iskele alanlarını zenginleştirme.
4. Su kanalı rotası ve özgün karşılaşmalar.
5. Bahçe terasları rotası.
6. Kök geçidi rotası.
7. Dost NPC ve kurtarma sistemi.
8. Silahlar, power-up ve araçlar.
9. Üç rota mini-boss'u.
10. Kök Motoru boss genişletmesi.
11. Özgün sanat/animasyon ve ses üretimi.
12. Üç rota uçtan uca oyun testleri.
13. Eski oyun sistemleri regresyon testleri.
14. İçerik sayımı, açık eksikler ve teslim raporu.

Bir aşamada eksik araç veya varlık nedeniyle engelle karşılaşırsan kaydet ve erişilebilir diğer aşamaların uygulanmasına devam et. Engeli gizleyip bütün bölüm tamamlandı deme.

**Son hedef:** Birinci bölüm, yalnızca birkaç düşman ve üç arka plan barındıran kısa bir prototip olarak kalmasın. Birbirinden mekanik olarak ayrılan üç güzergâhı, keşif ödülleri, karakterleri, kurtarma etkileşimleri, araçları, özgün animasyonları ve büyük finaliyle tek başına tekrar oynanmak istenecek zengin bir arcade macerasına dönüşsün.

Mevcut Aion Endless Run'ı koruyarak gerçekleştir. Metal Slug'ın ruhundaki içerik yoğunluğunu hedefle; AIONIA'nın kendi kimliğini üret.

Uygulamayı başlat ve mümkün olan kapsamı gerçekten tamamla. En sonda gerçekleşen üretimi, eksikleri ve test durumlarını sayısal olarak raporla.