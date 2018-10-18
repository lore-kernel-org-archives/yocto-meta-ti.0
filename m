Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1FF67E00994; Thu, 18 Oct 2018 10:33:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4375DE00971
	for <meta-ti@yoctoproject.org>; Thu, 18 Oct 2018 10:33:56 -0700 (PDT)
Received: by mail-qt1-f193.google.com with SMTP id d8-v6so35180315qtk.13
	for <meta-ti@yoctoproject.org>; Thu, 18 Oct 2018 10:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Qdqg/lwD8EZLMQLwfImie2fS6a8HBBC2gKLLcjuN8sw=;
	b=lZqOhN3h9g17rhlsptF+0eec8JAaJ9jhXlA66U9Pj7fibfLqi1rFEyQCiZ1FZQtzMI
	hw56EdvpW/efMJ3tRKbtDe+imknliul5MELsuNkwN06JVIyFjBssc0UtyuNiq0Fr6PQW
	q0Ws4z8sKx+lYX+krKNk/x2eatad9mvb/VJhp0oNZbFhBqzWH9kUC96z2R1m/Jn44tsV
	XANH0z9QVsfMEgrBQ1YHeSSErM19hx6hQ/lDWYWvo7IbcMCi4mnJ5gTFWKoQQ975eiJ3
	OIDqXyfBdL6WQbAy1oXKDWq6LgfjFD21/O3Ygrmo0q0waz3tBvvwsZxTZXQQlwzL8irF
	Nwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Qdqg/lwD8EZLMQLwfImie2fS6a8HBBC2gKLLcjuN8sw=;
	b=krumo7zNnlr16FcvYDETHLkvr7z8EU9ci89UEDeUJBBScSbfo53749Gnj8U2tLsPVT
	G5r2keuQOLsByZpRXAnP0lkJeR4TVAmGV9+iVIhaT8JcZwTHJz3GnRowUFBcgNqZrzeQ
	Xfvn6V79puEBSA0cqZOQummAMXIlLhgsQr5in+n7R9ytZC0LO/Dfg8Xd1hcEgIwajAo6
	igkEkHyUMyktd96pfBRbGRbWWt7Ks44rjgMbzbR6c2ESWPtsoeUIeIS3aTnVADMsS3RJ
	HZdIOkio7WsF6NXvhLGZ3SsjPOpxk1x8QpPJlzRUWGIpzVp9hOvDt0czwtQ+UzYz8/N6
	cZ+w==
X-Gm-Message-State: AGRZ1gLa4NDLk8q37FpzXLdUpnxPWRGTIcaYK/XWGqT8JD0VKx/3+GL2
	JopHLVDCFZoOE8KRt229IpqHzqVIKnotD0c6oDFQ7BIblCo=
X-Google-Smtp-Source: ACcGV63J/XssHvR+wpyGqxflNbWuUuREPVJn8O+R2x5mZWz0HgLly2L++zhw8nJA3KCEu4UONYXRWGWSArW20HDvG84=
X-Received: by 2002:aed:3e94:: with SMTP id
	n20-v6mr404583qtf.196.1539884035173; 
	Thu, 18 Oct 2018 10:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <20181018054946.22407-1-raj.khem@gmail.com>
	<20181018140900.GZ1032@bill-the-cat>
In-Reply-To: <20181018140900.GZ1032@bill-the-cat>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Oct 2018 10:33:28 -0700
Message-ID: <CAMKF1sr2bo2UG5u_Panm3EY0W5x3jNXNVgnxb=4YOth0w9T2nA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot: Alawys build with disabled PIE
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
X-List-Received-Date: Thu, 18 Oct 2018 17:33:57 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Tom

I think, it does for now. Eventually, it might be interesting to see if
u-boot could be compiled as static PIE, looking  at the code generated
by gcc for arm/beaglebone, there is additional penalty since arm gcc
is reloading pc-relative addresses, putting an extra slot in the
constant pool each time which can be significant if we use small
functions as seems to be the case in u-boot.

Thanks
-KhemOn Thu, Oct 18, 2018 at 7:09 AM Tom Rini <trini@konsulko.com> wrote:
>
> On Wed, Oct 17, 2018 at 10:49:46PM -0700, Khem Raj wrote:
> > some OE distros can default to hardened toolchains which means PIE is
> > added implicitly to compiler cmdline, here this options makes sure that
> > whattever the default toolchain are, u-boot is not impacted
> >
> > Fixes errors e.g.
> >
> > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not fit in region `.sram'
> > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Tom Rini <trini@konsulko.com>
> > Cc: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  .../0001-Always-build-with-fno-PIE.patch      | 35 +++++++++++++++++++
> >  .../u-boot/u-boot-ti-staging_2018.01.bb       |  2 ++
> >  2 files changed, 37 insertions(+)
> >  create mode 100644 recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patch
> >
> > diff --git a/recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patch b/recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patch
> > new file mode 100644
> > index 00000000..dfd99c66
> > --- /dev/null
> > +++ b/recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patch
> > @@ -0,0 +1,35 @@
> > +From ec81bbe3ea7e077512f4b9d2b4aa87e7f1494bcc Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 17 Oct 2018 22:32:57 -0700
> > +Subject: [PATCH] Always build with -fno-PIE
> > +
> > +GNU Toolchains can be configured to generate PIE by default
> > +while PIE could be ok, it is known that u-boot/SPL on ARM starts to
> > +generate bigger code and starts to overflow the SRAM size, therefore
> > +disabling PIE explcitly insulates against toolchain intrinsic defaults
> > +
> > +Fixes errors like
> > +| arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not fit in region `.sram'
> > +| arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Cc: Tom Rini <trini@konsulko.com>
> > +---
> > + Makefile | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 45cd751ba3..9eb8ac564e 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -592,6 +592,7 @@ KBUILD_CFLAGS    += -O2
> > + endif
> > +
> > + KBUILD_CFLAGS += $(call cc-option,-fno-stack-protector)
> > ++KBUILD_CFLAGS += $(call cc-option,-fno-PIE)
> > + KBUILD_CFLAGS += $(call cc-option,-fno-delete-null-pointer-checks)
> > +
> > + KBUILD_CFLAGS       += -g
> > +--
> > +2.19.1
> > +
> > diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> > index cbb8857a..c9c97111 100644
> > --- a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> > +++ b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
> > @@ -5,3 +5,5 @@ PR = "r24"
> >  BRANCH = "ti-u-boot-2018.01"
> >
> >  SRCREV = "2cc52408bf1357f11b96548e78223a1df321c1ae"
> > +
> > +SRC_URI += "file://0001-Always-build-with-fno-PIE.patch"
>
> So does this end up being something that is appropriate to push
> upstream?  Thanks!
>
> --
> Tom

