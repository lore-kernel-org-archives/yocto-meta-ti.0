Return-Path: <cliff.brake@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6A837E0074B; Fri, 11 Jul 2014 06:18:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.216.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32CE2E00736
	for <meta-ti@yoctoproject.org>; Fri, 11 Jul 2014 06:18:33 -0700 (PDT)
Received: by mail-qc0-f171.google.com with SMTP id w7so947605qcr.16
	for <meta-ti@yoctoproject.org>; Fri, 11 Jul 2014 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=ytxL0XdJq43yW9K7M93KOBcT2Bvt74SfZz2K97HcoEc=;
	b=xDNvNJoevoAakmglLRgSY+tlGTJBbJn9zjjEVDlLZUHSLyXgtl8Qv6+bP2hAMmmbY3
	Gic8oYdPZlF868IIAFc2yL/1VoogLaRAWmOKhl8O4ju/CRp0db0v6opkm0WqROBrrfFF
	oi26tgUQ7B0tfsOsi7unbitovJO84XXGLjyAzfkUMOxE3HWPFVnuDO2WZXLxK4Z7d4gO
	o++qMN00UQ5yneizvWY3X2CwvyTt2D0VzClOnVhVCwvQ+PogQvMnGsTXOjMzX2fZ1yx3
	1Ixi7HTemg80gFg8FJctbxGryPftoBEQxiE2MSnlj8+Xp91YH+Ley2kU14GOtmsk0b/y
	uiTA==
MIME-Version: 1.0
X-Received: by 10.140.102.37 with SMTP id v34mr24946136qge.115.1405084712842; 
	Fri, 11 Jul 2014 06:18:32 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.140.17.19 with HTTP; Fri, 11 Jul 2014 06:18:32 -0700 (PDT)
Date: Fri, 11 Jul 2014 09:18:32 -0400
X-Google-Sender-Auth: rvybYwpJGyYJewOVp6LAExCman8
Message-ID: <CAOd_LFxuEix6fEiRA8aA89OhR=tdPZTAp+NxfZAxA565Hirj_Q@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: [diasy] omap2plus_defconfig does not include systemd support
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
X-List-Received-Date: Fri, 11 Jul 2014 13:18:39 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'm trying to get a daisy build working on the beagleboard.  Its
currently building the linux-ti-staging-3.14 kernel for the bb.
However, this kernel appears to use the omap2plus_defconfig from the
http://git.ti.com/ti-linux-kernel repo.  What is the best path to get
omap2plus_defconfig modified to support systemd (its just a minor
tweak for cgroups?  Ideally, we'd get omap2plus_defconfig modified in
the upstream kernel.  Perhaps for now, we could have a config fragment
in the recipe?

NOTE: multiple providers are available for virtual/kernel
(linux-ti-staging, linux-mainline, linux-dummy, linux)
NOTE: consider defining a PREFERRED_PROVIDER entry to match virtual/kernel

Should the meta-ti layer be defining a prefered provider for the
beagleboard kernel?

Thanks,
Cliff

