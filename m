Subject: Re: Beaglebone Black Ethernet Failures
To: meta-ti@lists.yoctoproject.org
From: "Dave Tucker" <theaethereal@gmail.com>
X-Originating-Location: Troutville, Virginia, US (73.251.55.174)
X-Originating-Platform: Windows Firefox 86
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 12 Mar 2021 06:11:42 -0800
References: <CAOCHtYjagGkpX0EkZXDr_PrL4DHqkdYkXdhzraG1=+b+5xOASA@mail.gmail.com>
In-Reply-To: <CAOCHtYjagGkpX0EkZXDr_PrL4DHqkdYkXdhzraG1=+b+5xOASA@mail.gmail.com>
Message-ID: <2543.1615558302870675945@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="6pLiUyax3acKtvm4Sp4G"

--6pLiUyax3acKtvm4Sp4G
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Robert,

Thank you so much for the reply.=C2=A0 Do you know of a reference that exp=
lains this distinction between board and devicetree paths?=C2=A0 My google-=
fu is failing me.

I am loading a dtb file, but I don't know if that means I'm on the "device=
tree path".=C2=A0 I've configured u-boot to load from a uEnv.txt which look=
s like this, and that loads the dtb from the first partition, and I know th=
at part works:

bootfile=3DzImage
fdtfile=3Dam335x-boneblack.dtb
loadaddr=3D0x80007fc0
fdtaddr=3D0x80F80000
console=3DttyO0,115200
mmcroot=3D/dev/mmcblk1p2
mmcrootfstype=3Dext4
loadfdt=3Dfatload mmc 1:1 ${fdtaddr} ${fdtfile}
loaduimage=3Dfatload mmc 1:1 ${loadaddr} ${bootfile}
mmc_args=3Dsetenv bootargs console=3D${console} ${optargs} root=3D${mmcroo=
t} rootfstype=3D${mmcrootfstype}
fdtboot=3Drun mmc_args; bootz ${loadaddr} - ${fdtaddr}
uenvcmd=3Dmmc rescan; run loaduimage; run loadfdt; run fdtboot

Thank you so much,

Dave

--6pLiUyax3acKtvm4Sp4G
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Robert,<br /><br />Thank you so much for the reply.&nbsp; Do you know of=
 a reference that explains this distinction between board and devicetree pa=
ths?&nbsp; My google-fu is failing me.</p>
<p>I am loading a dtb file, but I don't know if that means I'm on the "dev=
icetree path".&nbsp; I've configured u-boot to load from a uEnv.txt which l=
ooks like this, and that loads the dtb from the first partition, and I know=
 that part works:</p>
<p>bootfile=3DzImage<br />fdtfile=3Dam335x-boneblack.dtb<br />loadaddr=3D0=
x80007fc0<br />fdtaddr=3D0x80F80000<br />console=3DttyO0,115200<br />mmcroo=
t=3D/dev/mmcblk1p2<br />mmcrootfstype=3Dext4<br />loadfdt=3Dfatload mmc 1:1=
 ${fdtaddr} ${fdtfile}<br />loaduimage=3Dfatload mmc 1:1 ${loadaddr} ${boot=
file}<br />mmc_args=3Dsetenv bootargs console=3D${console} ${optargs} root=
=3D${mmcroot} rootfstype=3D${mmcrootfstype}<br />fdtboot=3Drun mmc_args; b=
ootz ${loadaddr} - ${fdtaddr}<br />uenvcmd=3Dmmc rescan; run loaduimage; ru=
n loadfdt; run fdtboot</p>
<p>Thank you so much,<br /><br />Dave</p>

--6pLiUyax3acKtvm4Sp4G--
