Return-Path: <gschmottlach@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B68AAE00AFD; Mon, 20 Mar 2017 08:44:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (gschmottlach[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f175.google.com (mail-yw0-f175.google.com
	[209.85.161.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BC1FE00AA7
	for <meta-ti@yoctoproject.org>; Mon, 20 Mar 2017 08:44:18 -0700 (PDT)
Received: by mail-yw0-f175.google.com with SMTP id o4so92719421ywd.3
	for <meta-ti@yoctoproject.org>; Mon, 20 Mar 2017 08:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=s9XDLF+n3LFaGToJqGgnhGx9HBxBnoK4Q7CyKPKiQLo=;
	b=f3ERc5G94Z+DsoWhm40fjcxVV/dWsG+71bj5FTPqRQ07XUj8kJT5X+UwiFc82yTLoi
	Zy1h7xPfTRTAlY48U0Y9an+0RmCE5DExtR4u/awOiha5zB5qpDmw9HmoUn4hd975jbE2
	g80WZW5tKOFvq+FIFkHQipG3plCLkaeuf3b1xVdBD8LI4PcWTQ3PvSq7M5I1JL7L6lqY
	l+MOjEjGlxnPHudAHchCVQLHvqXINycMG5x6AXAiVXDeBYXwuOqATIIZOxJaU+X68IpA
	sG/Awa7nMVvLUsxtb1ggTlLrE59juKe0CK9kcd74CRdgZkeehIS1lnFN6tVUqLnJIr4Z
	CJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=s9XDLF+n3LFaGToJqGgnhGx9HBxBnoK4Q7CyKPKiQLo=;
	b=IK4Vksc2gsZezdhwZ5hr7oSfDB++XMdMAzXdzSJ+rdNpnhgSwVGrwGoZND6MgdLrPe
	jH285ju7/nx2P6BNnowgGn44LZbw2kRIgf249lIzOPl9rL6KWTHQqlxmfrSLFePG8e+U
	eXmwWJX81DnOhITAQrftvDThprOtSkO3HsEfHcSog7lw4lxCtoFDJp4Mr6GOokby5Bj7
	sQ1gl0ZDfd4GKS0IjX8Ur9Jkpv7XczjCF40meJ1P471jxV1T4gwgl2DUMEbRo63Nc4Bh
	v/aw5wLY+b+U9z2FcibIdkwsc25GUtbkBdx5HYxv8JTzxhr5eHEhgrvgl2x4oRbPboan
	tFvQ==
X-Gm-Message-State: AFeK/H3AbSGN45EPTrZkaNyWgZBxkHIc3MEgga35kdtTao0LvJXXdXMVKdgjR2Rjv2VVKpos3w3IrEvIqlOAxQ==
X-Received: by 10.37.5.207 with SMTP id 198mr18733964ybf.78.1490024657163;
	Mon, 20 Mar 2017 08:44:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.95.139 with HTTP; Mon, 20 Mar 2017 08:44:16 -0700 (PDT)
From: Glenn Schmottlach <gschmottlach@gmail.com>
Date: Mon, 20 Mar 2017 11:44:16 -0400
Message-ID: <CAMS2kBEyHe6y3rKD0RV=LXnSXR8kQY7yHuHtBQrb5gvDiX4RCg@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Trouble modifying defconfig for linux-ti-staging_rt recipe
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
X-List-Received-Date: Mon, 20 Mar 2017 15:44:21 -0000
Content-Type: text/plain; charset=UTF-8

I am having trouble modifying the kernel configuration for the
following TI kernel recipe using the Yocto Morty environment:

linux-ti-staging-rt_4.9.bb

I have created my own layer and with a *.bbappend file for this recipe, e.g.

linux-ti-staging-rt_4.9.bbappend

It appears the TI kernel recipes are not (yet) proper "Yocto" kernel
recipes in that they are not "fragment" aware. It appears I cannot do
the following inside of my *.bbappend recipe:

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI += "file://eem.cfg"

Inside of "eem.cfg" I want to set the following kernel options:

CONFIG_USB_NET_CDC_EEM=m
CONFIG_USB_F_EEM=m
CONFIG_USB_ETH_EEM=y

This has no affect. I tried creating my own defconfig based on the
'.config' generated from the original recipe. I modified my *.bbappend
file as follows:

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI += "file://defconfig"

Again, my defconfig is not applied to the build.

I even tried patching kernel-source/ti_config_fragments and placing a
eem.cfg in that directory hoping the configuration generation script
(defconfig_builder.sh) might apply this fragment.

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI += "file://0001-eem-config.patch"

Where the patch contains:

Index: kernel-source/ti_config_fragments/eem.cfg
===================================================================
--- /dev/null
+++ kernel-source/ti_config_fragments/eem.cfg
@@ -0,0 +1,4 @@
+CONFIG_USB_NET_CDC_EEM=m
+CONFIG_USB_F_EEM=m
+CONFIG_USB_ETH_EEM=y
+

Unfortunately this did not work either.

I suspect this question has been asked before, but what is the
RECOMMENDED procedure for making kernel configuration changes to the
TI kernel recipes in a Yocto environment? What methods have others
used to tweak the TI kernel options from their *.bbappend files?

Thanks for any insights . . .

