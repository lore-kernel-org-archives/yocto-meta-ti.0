Subject: Re: [PATCH][thud,master] am335x-evm.conf: Use soft assignment for MKUBIFS_ARGS, UBINIZE_ARGS
To: meta-ti@lists.yoctoproject.org
From: "Ankur Tyagi" <ankur.tyagi@gallagher.com>
X-Originating-Location: Hamilton, Waikato, NZ (203.167.229.98)
X-Originating-Platform: Windows Chrome 78
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 10 Dec 2019 11:38:07 -0800
References: <20191203052106.5254-1-ankur.tyagi@gallagher.com>
In-Reply-To: <20191203052106.5254-1-ankur.tyagi@gallagher.com>
Message-ID: <8881.1576006687300296709@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="b47ZPSzlgE0GT1yxhexR"

--b47ZPSzlgE0GT1yxhexR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

ping

On Mon, Dec 2, 2019 at 09:21 PM, Ankur Tyagi wrote:

>=20
> This is allow user to override them in their configuration
>=20
> Signed-off-by: Ankur Tyagi <ankur.tyagi@gallagher.com>
> ---
> conf/machine/am335x-evm.conf | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
> index 92e6cf05..8bfbee84 100644
> --- a/conf/machine/am335x-evm.conf
> +++ b/conf/machine/am335x-evm.conf
> @@ -24,7 +24,7 @@ SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
> # UBI: logical eraseblock size: 126976 bytes
> # from ubiattach stdout:
> # UBI device number 0, total 1988 LEBs
> -MKUBIFS_ARGS =3D "-F -m 2048 -e 126976 -c 9900"
> +MKUBIFS_ARGS ?=3D "-F -m 2048 -e 126976 -c 9900"
>=20
> # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
> # from dmesg:
> @@ -32,4 +32,4 @@ MKUBIFS_ARGS =3D "-F -m 2048 -e 126976 -c 9900"
> # UBI: physical eraseblock size: 131072 bytes (128 KiB)
> # UBI: sub-page size: 512
> # UBI: VID header offset: 2048 (aligned 2048)
> -UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512 -O 2048"
> +UBINIZE_ARGS ?=3D "-m 2048 -p 128KiB -s 512 -O 2048"
> --
> 2.17.1
>=20
>=20
> ########################################################################=
###
>=20
> This email is confidential and may contain information subject to legal
> privilege. If you are not the intended recipient please advise us of our
> error by return e-mail then delete this email and any attached files.
> You may not copy, disclose or use the contents in any way.
>=20
> The views expressed in this email may not be those of Gallagher Group
> Ltd or subsidiary companies thereof.
> ########################################################################=
###
>

--b47ZPSzlgE0GT1yxhexR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

ping&nbsp;<br /><br />On Mon, Dec 2, 2019 at 09:21 PM, Ankur Tyagi wrote:<b=
r />
<blockquote>This is allow user to override them in their configuration<br =
/><br />Signed-off-by: Ankur Tyagi &lt;ankur.tyagi@gallagher.com&gt;<br />-=
--<br />conf/machine/am335x-evm.conf | 4 ++--<br />1 file changed, 2 insert=
ions(+), 2 deletions(-)<br /><br />diff --git a/conf/machine/am335x-evm.con=
f b/conf/machine/am335x-evm.conf<br />index 92e6cf05..8bfbee84 100644<br />=
--- a/conf/machine/am335x-evm.conf<br />+++ b/conf/machine/am335x-evm.conf<=
br />@@ -24,7 +24,7 @@ SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"<br />=
# UBI: logical eraseblock size: 126976 bytes<br /># from ubiattach stdout:<=
br /># UBI device number 0, total 1988 LEBs<br />-MKUBIFS_ARGS =3D "-F -m 2=
048 -e 126976 -c 9900"<br />+MKUBIFS_ARGS ?=3D "-F -m 2048 -e 126976 -c 990=
0"<br /><br /># do ubiattach /dev/ubi_ctrl -m 7 -O 2048<br /># from dmesg:<=
br />@@ -32,4 +32,4 @@ MKUBIFS_ARGS =3D "-F -m 2048 -e 126976 -c 9900"<br /=
># UBI: physical eraseblock size: 131072 bytes (128 KiB)<br /># UBI: sub-pa=
ge size: 512<br /># UBI: VID header offset: 2048 (aligned 2048)<br />-UBINI=
ZE_ARGS =3D "-m 2048 -p 128KiB -s 512 -O 2048"<br />+UBINIZE_ARGS ?=3D "-m =
2048 -p 128KiB -s 512 -O 2048"<br />-- <br />2.17.1<br /><br /><br />######=
#####################################################################<br />=
This email is confidential and may contain information subject to legal <br=
 />privilege. If you are not the intended recipient please advise us of our=
<br />error by return e-mail then delete this email and any attached files.=
 <br />You may not copy, disclose or use the contents in any way. <br /><br=
 />The views expressed in this email may not be those of Gallagher Group <b=
r />Ltd or subsidiary companies thereof.<br />#############################=
##############################################</blockquote>

--b47ZPSzlgE0GT1yxhexR--
