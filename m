Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F155E00AB9; Wed, 17 Oct 2018 15:50:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.222.196 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B841E00A0C
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 15:50:34 -0700 (PDT)
Received: by mail-qk1-f196.google.com with SMTP id 84-v6so17646125qkf.0
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 15:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jMTDlSLOh4tLPNE8xNRxZvS9gkMDn6lsp7GAak/fM9M=;
	b=hkJJGG6xJ0/AAhaZka96hK8eYH61Z+yw/XH/Rac3j/F9JtSK2zoo/xRGwPz/rNNz4m
	5UhWgNxGHP7BuhQj/kFvQKPKlXyo3VG3HPf7kzoxvXBcAQZz3CmJ40Dg+jbZkqyd7zYY
	bADmVhmiIRWgDBWSH6VF5p90TK08LEBCtE22aShEN/0z/ZLD00l+vGfUa3OtYs4DuHZl
	OlHugWxgN03xyyt3lWe3SYx9ouIJWeYjoZu+yzq6S10vX9iA7JTNsYNWakG2Sokoao23
	1NzRFA6xiYY7ihWJCbWHXpxvzolprcXB7YZYWi/tTO1TlHBZIEXMxPW6ny1V9evpe3aG
	gOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jMTDlSLOh4tLPNE8xNRxZvS9gkMDn6lsp7GAak/fM9M=;
	b=fVYSn1bXMgeLZ4sDKE9+YVBp30H3hoU7R2s8ESYMc05bkd0LuTxkBm3Uf6Ucb0IaGN
	eQwPg6KWuKYYA2isORfDzyJN5+a/IzE5zWqsA1/7UchM5cNyHDk7xu5TZjSGwlFRv3cd
	sV26+Yy6colovtP6dal/dL3m/gLhoJhYbIbcVNxA+9RQDxj6YD6JYCWHUNdUI/J6hgmS
	1kWTaVPumsfzlUk+VS0vJCv+rYiI7ZIl4ze7HupF3v8HNzGJCWEdKTduB8Dt7Nj9ncCr
	XQUkbIzn4xWGHRKFjT0YJndFsvrcyWtkNNpAi4/zlWuB0juVDU3vWAcTVn8p/ypEt7MU
	FFcQ==
X-Gm-Message-State: ABuFfojJ+51uboDLcAv1duu0F5jS01HavrVlFc9tAFAtkSQLTe/blCwO
	p0KpWmwqi+bH9ulITeTuTVJ6it2VdeXf0amuczmLAqQn
X-Google-Smtp-Source: ACcGV62INHRQQUlNybr6X8BoS+BFQhoXYXNoD9D6/nD3BE+vnNasjnJiO5CDN29re1Ov4o8hQcXR4ay5vcfHMTu4p6o=
X-Received: by 2002:a37:5003:: with SMTP id e3-v6mr381214qkb.102.1539816633597;
	Wed, 17 Oct 2018 15:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20181017192853.42942-1-raj.khem@gmail.com>
	<20181017192853.42942-3-raj.khem@gmail.com>
	<20181017223449.GO4031@beryl>
In-Reply-To: <20181017223449.GO4031@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Oct 2018 15:50:21 -0700
Message-ID: <CAMKF1soD3NtXRFWvZ5n54D8_W1+D=MYM5Bx0Sc2p57RKWai4BQ@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org, Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH 3/5] u-boot: reduce the SPL `.rodata' size
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2018 22:50:36 -0000
Content-Type: multipart/alternative; boundary="0000000000007704460578747f67"

--0000000000007704460578747f67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 17, 2018 at 3:34 PM Denys Dmytriyenko <denys@ti.com> wrote:

> On Wed, Oct 17, 2018 at 12:28:51PM -0700, Khem Raj wrote:
> > Fixes errors e.g.
> >
> > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not
> fit in region `.sram'
> > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Tom Rini <trini@konsulko.com>
> > Cc: Denys Dmytriyenko <trini@konsulko.com>
>
> Hmm, interesting email I got here... :)
>
>
> Anyway, I'm going to hold on this one for now. Let's see if we can patch
> U-boot build instead.


Just don=E2=80=99t hold it because of the name :)
Btw there is something in master u-boot which makes it work with gcc+pie so
we can look at that and see if there is something to be backported but it
could also mean that there are additional features that get compiled in
with ti fork which cause the size to grow and break the size barrier

>
>
>
> > ---
> >  ...vm_defconfig-Reduce-SPL-.rodata-size.patch | 36 +++++++++++++++++++
> >  .../u-boot/u-boot-ti-staging_2018.01.bb       |  2 ++
> >  2 files changed, 38 insertions(+)
> >  create mode 100644
> recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-siz=
e.patch
> >
> > diff --git
> a/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-s=
ize.patch
> b/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-s=
ize.patch
> > new file mode 100644
> > index 00000000..6244a56a
> > --- /dev/null
> > +++
> b/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-s=
ize.patch
> > @@ -0,0 +1,36 @@
> > +From 45ead566ebf63999f07e966fa4962bb9bbe3ed4a Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 16 Oct 2018 17:11:13 -0700
> > +Subject: [PATCH] Disable usb-gadget usb-eth support in SPL
> > +
> > +This helps in shedding some size to fit in into SRAM
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + configs/am335x_evm_defconfig | 5 ++---
> > + 1 file changed, 2 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/configs/am335x_evm_defconfig b/configs/am335x_evm_defconf=
ig
> > +index 4908099431..8342089dee 100644
> > +--- a/configs/am335x_evm_defconfig
> > ++++ b/configs/am335x_evm_defconfig
> > +@@ -12,14 +12,13 @@ CONFIG_SYS_CONSOLE_INFO_QUIET=3Dy
> > + CONFIG_VERSION_VARIABLE=3Dy
> > + CONFIG_ARCH_MISC_INIT=3Dy
> > + CONFIG_SPL=3Dy
> > +-CONFIG_SPL_ETH_SUPPORT=3Dy
> > ++# CONFIG_SPL_ENV_SUPPORT is not set
> > + CONFIG_SPL_MTD_SUPPORT=3Dy
> > + CONFIG_SPL_MUSB_NEW_SUPPORT=3Dy
> > + CONFIG_SPL_NET_SUPPORT=3Dy
> > + CONFIG_SPL_NET_VCI_STRING=3D"AM335x U-Boot SPL"
> > + CONFIG_SPL_OS_BOOT=3Dy
> > +-CONFIG_SPL_USB_GADGET_SUPPORT=3Dy
> > +-CONFIG_SPL_USBETH_SUPPORT=3Dy
> > ++# CONFIG_SPL_YMODEM_SUPPORT is not set
> > + CONFIG_FASTBOOT=3Dy
> > + CONFIG_CMD_SPL=3Dy
> > + CONFIG_CMD_SPL_NAND_OFS=3D0x00080000
> > +--
> > +2.19.1
> > +
> > diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> > index cbb8857a..46a26480 100644
> > --- a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> > +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> > @@ -5,3 +5,5 @@ PR =3D "r24"
> >  BRANCH =3D "ti-u-boot-2018.01"
> >
> >  SRCREV =3D "2cc52408bf1357f11b96548e78223a1df321c1ae"
> > +
> > +SRC_URI +=3D
> "file://0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch"
> > --
> > 2.19.1
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>

--0000000000007704460578747f67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed,=
 Oct 17, 2018 at 3:34 PM Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.c=
om">denys@ti.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On =
Wed, Oct 17, 2018 at 12:28:51PM -0700, Khem Raj wrote:<br>
&gt; Fixes errors e.g.<br>
&gt; <br>
&gt; | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata&#39; will =
not fit in region `.sram&#39;<br>
&gt; | arm-yoe-linux-gnueabi-ld.bfd: region `.sram&#39; overflowed by 5772 =
bytes<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; Cc: Tom Rini &lt;<a href=3D"mailto:trini@konsulko.com" target=3D"_blan=
k">trini@konsulko.com</a>&gt;<br>
&gt; Cc: Denys Dmytriyenko &lt;<a href=3D"mailto:trini@konsulko.com" target=
=3D"_blank">trini@konsulko.com</a>&gt;<br>
<br>
Hmm, interesting email I got here... :)<br>
<br>
<br>
Anyway, I&#39;m going to hold on this one for now. Let&#39;s see if we can =
patch <br>
U-boot build instead.</blockquote><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Just don=E2=80=99t hold it because of the name :)</div><div dir=3D"aut=
o">Btw there is something in master u-boot which makes it work with gcc+pie=
 so we can look at that and see if there is something to be backported but =
it could also mean that there are additional features that get compiled in =
with ti fork which cause the size to grow and break the size barrier=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><br>
<br>
<br>
&gt; ---<br>
&gt;=C2=A0 ...vm_defconfig-Reduce-SPL-.rodata-size.patch | 36 +++++++++++++=
++++++<br>
&gt;=C2=A0 .../u-boot/<a href=3D"http://u-boot-ti-staging_2018.01.bb" rel=
=3D"noreferrer" target=3D"_blank">u-boot-ti-staging_2018.01.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
&gt;=C2=A0 2 files changed, 38 insertions(+)<br>
&gt;=C2=A0 create mode 100644 recipes-bsp/u-boot/files/0001-am335x_evm_defc=
onfig-Reduce-SPL-.rodata-size.patch<br>
&gt; <br>
&gt; diff --git a/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce=
-SPL-.rodata-size.patch b/recipes-bsp/u-boot/files/0001-am335x_evm_defconfi=
g-Reduce-SPL-.rodata-size.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000..6244a56a<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.r=
odata-size.patch<br>
&gt; @@ -0,0 +1,36 @@<br>
&gt; +From 45ead566ebf63999f07e966fa4962bb9bbe3ed4a Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Tue, 16 Oct 2018 17:11:13 -0700<br>
&gt; +Subject: [PATCH] Disable usb-gadget usb-eth support in SPL<br>
&gt; +<br>
&gt; +This helps in shedding some size to fit in into SRAM<br>
&gt; +<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + configs/am335x_evm_defconfig | 5 ++---<br>
&gt; + 1 file changed, 2 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/configs/am335x_evm_defconfig b/configs/am335x_evm_defcon=
fig<br>
&gt; +index 4908099431..8342089dee 100644<br>
&gt; +--- a/configs/am335x_evm_defconfig<br>
&gt; ++++ b/configs/am335x_evm_defconfig<br>
&gt; +@@ -12,14 +12,13 @@ CONFIG_SYS_CONSOLE_INFO_QUIET=3Dy<br>
&gt; + CONFIG_VERSION_VARIABLE=3Dy<br>
&gt; + CONFIG_ARCH_MISC_INIT=3Dy<br>
&gt; + CONFIG_SPL=3Dy<br>
&gt; +-CONFIG_SPL_ETH_SUPPORT=3Dy<br>
&gt; ++# CONFIG_SPL_ENV_SUPPORT is not set<br>
&gt; + CONFIG_SPL_MTD_SUPPORT=3Dy<br>
&gt; + CONFIG_SPL_MUSB_NEW_SUPPORT=3Dy<br>
&gt; + CONFIG_SPL_NET_SUPPORT=3Dy<br>
&gt; + CONFIG_SPL_NET_VCI_STRING=3D&quot;AM335x U-Boot SPL&quot;<br>
&gt; + CONFIG_SPL_OS_BOOT=3Dy<br>
&gt; +-CONFIG_SPL_USB_GADGET_SUPPORT=3Dy<br>
&gt; +-CONFIG_SPL_USBETH_SUPPORT=3Dy<br>
&gt; ++# CONFIG_SPL_YMODEM_SUPPORT is not set<br>
&gt; + CONFIG_FASTBOOT=3Dy<br>
&gt; + CONFIG_CMD_SPL=3Dy<br>
&gt; + CONFIG_CMD_SPL_NAND_OFS=3D0x00080000<br>
&gt; +-- <br>
&gt; +2.19.1<br>
&gt; +<br>
&gt; diff --git a/recipes-bsp/u-boot/<a href=3D"http://u-boot-ti-staging_20=
18.01.bb" rel=3D"noreferrer" target=3D"_blank">u-boot-ti-staging_2018.01.bb=
</a> b/recipes-bsp/u-boot/<a href=3D"http://u-boot-ti-staging_2018.01.bb" r=
el=3D"noreferrer" target=3D"_blank">u-boot-ti-staging_2018.01.bb</a><br>
&gt; index cbb8857a..46a26480 100644<br>
&gt; --- a/recipes-bsp/u-boot/<a href=3D"http://u-boot-ti-staging_2018.01.b=
b" rel=3D"noreferrer" target=3D"_blank">u-boot-ti-staging_2018.01.bb</a><br=
>
&gt; +++ b/recipes-bsp/u-boot/<a href=3D"http://u-boot-ti-staging_2018.01.b=
b" rel=3D"noreferrer" target=3D"_blank">u-boot-ti-staging_2018.01.bb</a><br=
>
&gt; @@ -5,3 +5,5 @@ PR =3D &quot;r24&quot;<br>
&gt;=C2=A0 BRANCH =3D &quot;ti-u-boot-2018.01&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRCREV =3D &quot;2cc52408bf1357f11b96548e78223a1df321c1ae&quot;<=
br>
&gt; +<br>
&gt; +SRC_URI +=3D &quot;file://0001-am335x_evm_defconfig-Reduce-SPL-.rodat=
a-size.patch&quot;<br>
&gt; -- <br>
&gt; 2.19.1<br>
&gt; <br>
&gt; -- <br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">meta-ti@=
yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti<=
/a><br>
</blockquote></div></div>

--0000000000007704460578747f67--
