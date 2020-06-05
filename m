Subject: Inverted colors in Qt application with beaglebone/am335x and QT_QPA_PLATFORM=eglfs
To: meta-ti@lists.yoctoproject.org
From: "Luca" <magnabosco.luca@gmail.com>
X-Originating-Location: Trissino, Veneto, IT (94.126.15.98)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 05 Jun 2020 02:23:41 -0700
Message-ID: <PmuX.1591349021569680074.VluT@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="A5u46X4WvpgAMvcKeGRP"

--A5u46X4WvpgAMvcKeGRP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

running some QT applications with `QT_QPA_PLATFORM=3Deglfs` and ` QT_QPA_E=
GLFS_INTEGRATION=3Deglfs_kms ` I am experiencing some issues:

* running Qt5_CinematicExperience the red and blue color are inverted. Apa=
rt from that the application seems to rung just fine
* running qtwebbrowser 5.13.2 ( git://code.qt.io/qt-apps/qtwebbrowser.git =
) the red and blue color are inverted and the webpage refresh seems to be v=
ery slow

Using:

* meta-ti tag ti2020.00 branch zeus
* qt configured exactly as it is done in meta-arago tag ti2020.00, without=
 `wayland` in `DISTRO_FEATURES`
* poky: branch zeus, commit ca9cc50
* meta-openembedded: branch zeus, commit 44e458f
* MACHINE set to beaglebone

Notes:

* Considering TI SDK guide ( http://software-dl.ti.com/processor-sdk-linux=
/esd/docs/latest/linux/Foundational_Components/Graphics/AM3_Beagle_Bone_Bla=
ck_Configuration.html#am3-beagle-bone-black-board-configuration ) I tried t=
o update the `etc/powervr.ini` setting DefaultPixelFormat=3DRGB565 but it s=
eems the change
* I tried to set ` "format": "rgb565"` in=C2=A0eglfs_kms_cfg.json but that=
 causes an error when running with "-platform eglfs" (or QT_QPA_PLATFORM=3D=
eglfs)

qt.qpa.eglfs.kms: Creating gbm_surface for screen LVDS1
EGL Error : Could not create the egl surface: error =3D 0x3009

Any suggestion would be very appreciated.

Regards
Luca

--A5u46X4WvpgAMvcKeGRP
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,<br /><br />running some QT applications with `QT_QPA_PLATFORM=3Degl=
fs` and `<span id=3D"docs-internal-guid-dfd984c0-7fff-2b09-0788-7848c77437b=
c"><span style=3D"font-size: 11pt; font-family: Arial; color: #000000; back=
ground-color: transparent; font-variant-numeric: normal; font-variant-east-=
asian: normal; vertical-align: baseline; white-space: pre-wrap;">QT_QPA_EGL=
FS_INTEGRATION=3Deglfs_kms</span></span>` I am experiencing some issues:<br=
 />
<ul>
<li>running&nbsp;<span id=3D"docs-internal-guid-9145ffe0-7fff-f32d-1080-db=
aa07d2e3c2">Qt5_CinematicExperience </span>the red and blue color are inver=
ted. Apart from that the application seems to rung just fine</li>
<li>running <a href=3D"git://code.qt.io/qt-apps/qtwebbrowser.git" target=
=3D"_blank" rel=3D"noopener">qtwebbrowser 5.13.2</a>&nbsp;the red and blue=
 color are inverted and the webpage refresh seems to be very slow</li>
</ul>
<br />Using:<br />
<ul>
<li>meta-ti tag ti2020.00 branch zeus</li>
<li>qt configured exactly as it is done in meta-arago tag ti2020.00, witho=
ut `wayland` in `DISTRO_FEATURES`</li>
<li><span style=3D"font-family: 'helvetica neue'; font-size: 11pt;">poky: =
branch zeus, commit ca9cc50</span></li>
<li><span style=3D"font-family: 'helvetica neue'; font-size: 11pt;">meta-o=
penembedded: branch zeus, commit 44e458f</span></li>
<li><span style=3D"font-family: 'helvetica neue'; font-size: 11pt;">MACHIN=
E set to beaglebone</span></li>
</ul>
<br />Notes:<br />
<ul>
<li>Considering <a href=3D"http://software-dl.ti.com/processor-sdk-linux/e=
sd/docs/latest/linux/Foundational_Components/Graphics/AM3_Beagle_Bone_Black=
_Configuration.html#am3-beagle-bone-black-board-configuration" target=3D"_b=
lank" rel=3D"noopener">TI SDK guide</a> I tried to update the `etc/powervr.=
ini` setting DefaultPixelFormat=3DRGB565 but it seems the change&nbsp;</li>
<li>I tried to set `<span id=3D"docs-internal-guid-10f20ee1-7fff-2364-056a=
-edef36a378ff">"format": "rgb565"` in&nbsp;eglfs_kms_cfg.json but that caus=
es an error when running with "-platform eglfs" (or QT_QPA_PLATFORM=3Deglfs=
)</span></li>
</ul>
<div style=3D"padding-left: 60px;">
<p dir=3D"ltr" style=3D"line-height: 1.38; margin-top: 0pt; margin-bottom:=
 0pt;"><span style=3D"font-size: 10pt; font-family: 'Courier New'; color: #=
000000; background-color: transparent; font-variant-numeric: normal; font-v=
ariant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;=
">qt.qpa.eglfs.kms: Creating gbm_surface for screen LVDS1<br /><span id=3D"=
docs-internal-guid-f5683804-7fff-72d6-b704-a727d4224aee"><span style=3D"fon=
t-size: 10pt; background-color: transparent; font-variant-numeric: normal; =
font-variant-east-asian: normal; vertical-align: baseline;">EGL Error : Cou=
ld not create the egl surface: error =3D 0x3009</span></span><br /></span><=
/p>
<div><span style=3D"font-size: 10pt; font-family: 'Courier New'; color: #0=
00000; background-color: transparent; font-variant-numeric: normal; font-va=
riant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;"=
>&nbsp;</span></div>
</div>
Any suggestion would be very appreciated.<br /><br />Regards<br />Luca

--A5u46X4WvpgAMvcKeGRP--
