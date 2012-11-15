Return-Path: <marek.belisko@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98F88E00498
	for <meta-ti@yoctoproject.org>; Thu, 15 Nov 2012 12:32:08 -0800 (PST)
Received: by mail-ie0-f176.google.com with SMTP id k11so2959946iea.35
	for <meta-ti@yoctoproject.org>; Thu, 15 Nov 2012 12:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=IFDoUE8gzRzfXrmGWcieDOPhN6Rp33JGungiTdInpVI=;
	b=Z//yak66SUV8PwxJXAhhSJlxL8Tol9E/HTSZkA13IFCzWPbw5wdkzYUp1KCSKrwEuX
	xvkeZo3g9GQ8cvwqX+sKYK53ZQifxRO3FDhHLiEu1zVZAf4EbLGK2IBnjzRfV2EBRsIR
	7KE41hBOMZc36urw4RhkftV1rngGvPlUaPPotSghHzg/TkSaZr5yc0t1oMOtc+99J+8N
	W9XGAjKYmn/aeCUoK3kBViGEll8JAZ2fsw/VtXNDqnmX215JUWHZMAgkOevJUSGTmP/V
	4NxjYFIinP/NaVjdWu5PiQZdljHf7nh0JRbpaWwA5FaAeK/JrcyejkK2Y9mPV6BElXtT
	Nm9g==
MIME-Version: 1.0
Received: by 10.42.68.203 with SMTP id y11mr1898464ici.26.1353011528004; Thu,
	15 Nov 2012 12:32:08 -0800 (PST)
Received: by 10.64.171.82 with HTTP; Thu, 15 Nov 2012 12:32:07 -0800 (PST)
Date: Thu, 15 Nov 2012 21:32:07 +0100
Message-ID: <CAAfyv35DeRd1qECdKmy9TX2EJ3Xs68C0wGFck-qxD3AH6YYLCw@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
To: meta-ti@yoctoproject.org
Subject: pandaboard fails to fetch 3.4 kernel
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
X-List-Received-Date: Thu, 15 Nov 2012 20:32:08 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'm using meta-ti in yocto to build pandaboard image.
During building I've got erro about fetching kernel:

Build Configuration:
BB_VERSION        = "1.16.0"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "pandaboard"
DISTRO            = "poky"
DISTRO_VERSION    = "1.3"
TUNE_FEATURES     = "armv7a vfp neon cortexa9"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto
meta-yocto-bsp    = "<unknown>:<unknown>"
meta-ti           = "master:c23f472783a5cab482d62c4ed31874c69397dbfe"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: Failed to fetch URL
git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487,
attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
Cloning into bare repository
'/home/open-nandra/yocto/poky-danny-8.0/panda_build/downloads/git2/dev.omapzoom.org.pub.scm.integration.kernel-ubuntu.git'...

fatal: The remote end hung up unexpectedly
fatal: early EOF
fatal: index-pack failed

ERROR: Function failed: Fetcher failure for URL:
'git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487'.
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in:
/home/open-nandra/yocto/poky-danny-8.0/panda_build/tmp/work/pandaboard-poky-linux-gnueabi/linux-omap4-3.4-r0/temp/log.do_fetch.19671
ERROR: Task 681
(/home/open-nandra/yocto/meta-ti/recipes-kernel/linux/linux-omap4_3.4.bb,
do_fetch) failed with exit code '1'

Any idea? I've try fetch from git manually and it works.

Thanks,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

