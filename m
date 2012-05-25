Return-Path: <kgy@teledigit.eu>
Received: from teledigit.eu (teledigit.eu [195.56.148.37])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 859B9E01402
	for <meta-ti@yoctoproject.org>; Fri, 25 May 2012 00:45:25 -0700 (PDT)
X-AuthUser: kgy@teledigit.eu
Received: from linux-oxe9.localnet ([195.228.189.97]:60718)
	by teledigit.eu with [XMail 1.27 ESMTP Server]
	id <S7F48> for <meta-ti@yoctoproject.org> from <kgy@teledigit.eu>;
	Fri, 25 May 2012 10:41:48 +0200
From: Gyorgy Kovesdi <kgy@teledigit.eu>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Date: Fri, 25 May 2012 09:45:15 +0200
Message-ID: <3408799.xmIZDQfG6A@linux-oxe9>
Organization: NNG
User-Agent: KMail/4.7.2 (Linux/3.1.9-1.4-desktop; KDE/4.7.2; x86_64; ; )
MIME-Version: 1.0
Subject: meta-ti and poky
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
X-List-Received-Date: Fri, 25 May 2012 07:45:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

I just cloned Poky, and have my first running yocto build for Beagleboard-C4 without any problem.
I tried to add meta-ti, but bitbake gives this error message for all targets:

ERROR: Failure expanding variable FILESPATH, expression was ${@base_set_filespath([ "/home/kgy/work/Yoctoproject/Poky/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_1_24_02_09-${MACHINE_KERNEL_PR}e", "/home/kgy/work/Yoctoproject/Poky/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_24_02_09", "/home/kgy/work/Yoctoproject/Poky/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager", "/home/kgy/work/Yoctoproject/Poky/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_24_02_09", "/home/kgy/work/Yoctoproject/Poky/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager", "/home/kgy/work/Yoctoproject/Poky/meta-ti/recipes-ti/local-power-manager/files", "/home/kgy/work/Yoctoproject/Poky/meta-ti/recipes-ti/local-power-manager" ], d)} which triggered exception SyntaxError: EOL while scanning string literal (FILESPATH, line 1)                                                            
ERROR: Command execution failed: Exited with 1

Unfortunately, i could not find the reason.
my bblayers.conf file:

# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
LCONF_VERSION = "4"
BBFILES ?= ""
BBLAYERS ?= " \
  /home/kgy/work/Yoctoproject/Poky/meta \
  /home/kgy/work/Yoctoproject/Poky/meta-yocto \
  /home/kgy/work/Yoctoproject/Poky/meta-ti \
  "

What can be wrong here?

Another question is the current state of Beagleboard support here. I found some mails about it, but
reportedly it is not fully supported here. I see that some recipes are written for Angstrom project.
Is it possible to get running libgles-omap3 here? I used it for Angstrom, but it works only with 2.6 kernels .

Many Thanx
Gyorgy Kovesdi


