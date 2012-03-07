Return-Path: <jkridner@beagleboard.org>
Received: from mail-yx0-f181.google.com (mail-yx0-f181.google.com
	[209.85.213.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6176E013A2
	for <meta-ti@lists.yoctoproject.org>;
	Wed,  7 Mar 2012 07:20:43 -0800 (PST)
Received: by yenq2 with SMTP id q2so4299807yen.26
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 07 Mar 2012 07:20:43 -0800 (PST)
Received: by 10.60.11.40 with SMTP id n8mr854647oeb.61.1331133642882;
	Wed, 07 Mar 2012 07:20:42 -0800 (PST)
Received: from mail-pz0-f49.google.com (mail-pz0-f49.google.com
	[209.85.210.49])
	by mx.google.com with ESMTPS id b2sm21282323obo.22.2012.03.07.07.20.41
	(version=SSLv3 cipher=OTHER); Wed, 07 Mar 2012 07:20:42 -0800 (PST)
Received: by dakp5 with SMTP id p5so8413275dak.8
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 07 Mar 2012 07:20:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.68.201.201 with SMTP id kc9mr4033791pbc.143.1331133640916;
	Wed, 07 Mar 2012 07:20:40 -0800 (PST)
Received: by 10.142.108.13 with HTTP; Wed, 7 Mar 2012 07:20:40 -0800 (PST)
In-Reply-To: <1331111487-21170-1-git-send-email-koen@dominion.thruhere.net>
References: <1331111487-21170-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 7 Mar 2012 10:20:40 -0500
Message-ID: <CA+T6QP=hTW9YPMVwoQvqi+TgOrMJWXrC9ePH2trGbajCV4=6-Q@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkXY7zbFOe1hLj0D00+PHgl/Di6wIUdyivQo709Q7A+ufqVQuHNJfjBnu8FlPzkAHXJOuNE
Cc: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH] gadget init: don't dump info to info.txt on boot
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2012 15:20:43 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c080d0bf1704baa8b372

--e89a8ff1c080d0bf1704baa8b372
Content-Type: text/plain; charset=ISO-8859-1

On Wednesday, March 7, 2012, Koen Kooi wrote:

> This script adds ~10s to the boot time, doesn't have error checking and
> prevents loading the storage gadget 3 out of 10 times.
>

What is the root cause?  Would it be better to add error checking?


>
> Remove it from ExecStartPre to get a fast, consistent boot. The
> functionality should be moved to bone101.
>

If the drive is already mounted, is it valid to edit this file?  (I would
think not.)


>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net <javascript:;>>
> ---
>  recipes-ti/beagleboard/gadget-init.bb              |    2 +-
>  .../gadget-init/storage-gadget-init.service        |    1 -
>  2 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-ti/beagleboard/gadget-init.bbb/recipes-ti/beagleboard/
> gadget-init.bb
> index 016877d..1a6a336 100644
> --- a/recipes-ti/beagleboard/gadget-init.bb
> +++ b/recipes-ti/beagleboard/gadget-init.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Units to initialize usb gadgets"
>
> -PR = "r18"
> +PR = "r19"
>
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM =
> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
> diff --git
> a/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
> b/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
> index 601e0d7..9a8513e 100644
> --- a/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
> +++ b/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service
> @@ -4,7 +4,6 @@ After=dev-mmcblk0p1.device
>
>  [Service]
>  RemainAfterExit=yes
> -ExecStartPre=/usr/bin/update-image-info-on-mmcblk0p1.sh
>  ExecStart=/sbin/modprobe g_mass_storage file=/dev/mmcblk0p1 cdrom=0
> stall=0 removable=1 nofua=1
>  ExecStop=/sbin/rmmod g_mass_storage
>
> --
> 1.7.2.5
>
>

--e89a8ff1c080d0bf1704baa8b372
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wednesday, March 7, 2012, Koen Kooi  wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">This script adds ~10s to the boot time, doesn&#39;t have error checki=
ng and prevents loading the storage gadget 3 out of 10 times.<br>
</blockquote><div><br></div><div>What is the root cause? =A0Would it be bet=
ter to add error checking?</div><div>=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<br>
Remove it from ExecStartPre to get a fast, consistent boot. The functionali=
ty should be moved to bone101.<br></blockquote><div><br></div><div>If the d=
rive is already mounted, is it valid to edit this file? =A0(I would think n=
ot.)</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Koen Kooi &lt;<a href=3D"javascript:;" onclick=3D"_e(event, =
&#39;cvml&#39;, &#39;koen@dominion.thruhere.net&#39;)">koen@dominion.thruhe=
re.net</a>&gt;<br>
---<br>
=A0recipes-ti/beagleboard/<a href=3D"http://gadget-init.bb" target=3D"_blan=
k">gadget-init.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-<br>
=A0.../gadget-init/storage-gadget-init.service =A0 =A0 =A0 =A0| =A0 =A01 -<=
br>
=A02 files changed, 1 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-ti/beagleboard/<a href=3D"http://gadget-init.bb" targe=
t=3D"_blank">gadget-init.bb</a> b/recipes-ti/beagleboard/<a href=3D"http://=
gadget-init.bb" target=3D"_blank">gadget-init.bb</a><br>
index 016877d..1a6a336 100644<br>
--- a/recipes-ti/beagleboard/<a href=3D"http://gadget-init.bb" target=3D"_b=
lank">gadget-init.bb</a><br>
+++ b/recipes-ti/beagleboard/<a href=3D"http://gadget-init.bb" target=3D"_b=
lank">gadget-init.bb</a><br>
@@ -1,6 +1,6 @@<br>
=A0DESCRIPTION =3D &quot;Units to initialize usb gadgets&quot;<br>
<br>
-PR =3D &quot;r18&quot;<br>
+PR =3D &quot;r19&quot;<br>
<br>
=A0LICENSE =3D &quot;MIT&quot;<br>
=A0LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/LICENSE;md5=3D3f40d7994397=
109285ec7b81fdeb3b58&quot;<br>
diff --git a/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service=
 b/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service<br>
index 601e0d7..9a8513e 100644<br>
--- a/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service<br>
+++ b/recipes-ti/beagleboard/gadget-init/storage-gadget-init.service<br>
@@ -4,7 +4,6 @@ After=3Ddev-mmcblk0p1.device<br>
<br>
=A0[Service]<br>
=A0RemainAfterExit=3Dyes<br>
-ExecStartPre=3D/usr/bin/update-image-info-on-mmcblk0p1.sh<br>
=A0ExecStart=3D/sbin/modprobe g_mass_storage file=3D/dev/mmcblk0p1 cdrom=3D=
0 stall=3D0 removable=3D1 nofua=3D1<br>
=A0ExecStop=3D/sbin/rmmod g_mass_storage<br>
<br>
--<br>
1.7.2.5<br>
<br>
</blockquote>

--e89a8ff1c080d0bf1704baa8b372--
