Return-Path: <raj.khem@gmail.com>
Received: from mail-ia0-f178.google.com (mail-ia0-f178.google.com
	[209.85.210.178]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id CA6A0E002AB
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 22:18:46 -0800 (PST)
Received: by mail-ia0-f178.google.com with SMTP id y26so3105129iab.23
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 22:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=ANs/tVaEFhQXSDUP9tkFHoAeXmsuqItMrK5kAgN8E0A=;
	b=ZVldQc77pa/P7pOAB35G4nzPtYjckFNwadd33JTqPVwn3400emcIICnRHkxRpmKiHg
	N8PNCaqJF8DWJyXDgJ3JzEu+WEYrMLo6VOi3/1VTXVJMyYfBl4vzjf26i1WgM+U6uBhM
	tB8zR3Ml0YMh1Rx6yahlgeUeTWqLiODpYE3j3a+Dqku7X5QnJUM/F0JdC2lVBxtJzlw3
	IoFssKVbxo7ZSCJ33mrv2x6jsq//VIbxGLraQQ2gs0h7fph3/dwOOeWCMgW3SzN9k+Su
	xGcNDfocyQCsLuqF5pA63Dx0ADZ8LeUWbAodf/To/aYK4p3bqpkAaEF75CT6SOMNxEH+
	kk/A==
X-Received: by 10.50.56.141 with SMTP id a13mr5033083igq.24.1361859526029;
	Mon, 25 Feb 2013 22:18:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.13.204 with HTTP; Mon, 25 Feb 2013 22:18:15 -0800 (PST)
In-Reply-To: <1361853748-24166-1-git-send-email-denis@denix.org>
References: <1361853748-24166-1-git-send-email-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Feb 2013 22:18:15 -0800
Message-ID: <CAMKF1soyC8T4jau0jWrEHoGD_+OcpUBV3KtUeh5tT1OaHONemA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCHv2] linux-omap-psp: fix alignment issue of 2.6.37 kernel with gcc-4.7
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
X-List-Received-Date: Tue, 26 Feb 2013 06:18:47 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 25, 2013 at 8:42 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Patch by Steve Sakoman
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v2 - move patch to a common location

btw. this wont be needed in kernels released after
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=8428e84d42179c2a00f5f6450866e70d802d1d05

so probably its better stay in specific kernel dirs which need it.

>
>  .../files/0001-arm-fix-builds-with-gcc-4.7.patch   | 26 ++++++++++++++++++++++
>  recipes-kernel/linux/linux-omap-psp_2.6.37.bb      |  9 ++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 recipes-kernel/linux/files/0001-arm-fix-builds-with-gcc-4.7.patch
>
> diff --git a/recipes-kernel/linux/files/0001-arm-fix-builds-with-gcc-4.7.patch b/recipes-kernel/linux/files/0001-arm-fix-builds-with-gcc-4.7.patch
> new file mode 100644
> index 0000000..db701e2
> --- /dev/null
> +++ b/recipes-kernel/linux/files/0001-arm-fix-builds-with-gcc-4.7.patch
> @@ -0,0 +1,26 @@
> +From 0d12debe917269a013f8eddd42da8d3de5e3174e Mon Sep 17 00:00:00 2001
> +From: Steve Sakoman <steve@sakoman.com>
> +Date: Thu, 24 Jan 2013 15:42:01 -0800
> +Subject: [PATCH] arm: fix builds with gcc 4.7
> +
> +new unaligned access support in GCC was triggering an alignment fault at boot
> +---
> + arch/arm/kernel/head.S | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
> +index 6bd82d2..56b02cd 100644
> +--- a/arch/arm/kernel/head.S
> ++++ b/arch/arm/kernel/head.S
> +@@ -336,7 +336,7 @@ __secondary_data:
> +  *  r13 = *virtual* address to jump to upon completion
> +  */
> + __enable_mmu:
> +-#ifdef CONFIG_ALIGNMENT_TRAP
> ++#if defined(CONFIG_ALIGNMENT_TRAP) && __LINUX_ARM_ARCH__ < 6
> +       orr     r0, r0, #CR_A
> + #else
> +       bic     r0, r0, #CR_A
> +--
> +1.8.1.2
> +
> diff --git a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
> index bafeba5..9eacfc9 100644
> --- a/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
> +++ b/recipes-kernel/linux/linux-omap-psp_2.6.37.bb
> @@ -6,6 +6,10 @@ COMPATIBLE_MACHINE = "omap3"
>
>  SRCREV= "20c003f2f024d9f50f59edf9f1b8f5f035fb15b8"
>
> +# The main PR is now using MACHINE_KERNEL_PR, for omap3 devices
> +# see conf/machine/include/omap3.inc
> +MACHINE_KERNEL_PR_append = "a"
> +
>  SRC_URI = "git://arago-project.org/git/projects/linux-omap3.git;protocol=git \
>             file://defconfig"
>
> @@ -83,6 +87,11 @@ SRC_URI += " \
>      file://0002-usb-musb-am35x-fix-role-switching-issue.patch \
>  "
>
> +# Fix alignment issue with gcc-4.7
> +SRC_URI += " \
> +    file://0001-arm-fix-builds-with-gcc-4.7.patch \
> +"
> +
>  # Updated PIO mode for MUSB help description
>  SRC_URI_append_am3517-evm = " file://0001-musb-update-PIO-mode-help-information-in-Kconfig.patch"
>
> --
> 1.8.1.4
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

