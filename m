Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7DA18E0034A; Fri, 27 Feb 2015 09:06:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C74F9E002F9
	for <meta-ti@yoctoproject.org>; Fri, 27 Feb 2015 09:06:20 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1RH6JCl000751
	for <meta-ti@yoctoproject.org>; Fri, 27 Feb 2015 11:06:19 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1RH6IVj010390
	for <meta-ti@yoctoproject.org>; Fri, 27 Feb 2015 11:06:18 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 27 Feb 2015 11:06:18 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1RH6IRp020026;
	Fri, 27 Feb 2015 11:06:18 -0600
Date: Fri, 27 Feb 2015 12:06:17 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Carlos Hernandez <ceh@ti.com>
Message-ID: <20150227170617.GK6052@edge>
References: <20150227013301.531B352A65@arago-project.org>
	<54F0679C.4030007@ti.com> <54F06FC4.3070608@ti.com>
MIME-Version: 1.0
In-Reply-To: <54F06FC4.3070608@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Denys Dmytriyenko : udev: rules for seamless transition to 8250_omap serial driver
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
X-List-Received-Date: Fri, 27 Feb 2015 17:06:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hmm, that's weird, I'll check...

On Fri, Feb 27, 2015 at 08:23:16AM -0500, Carlos Hernandez wrote:
> BTW, the rule is fine but for some reason is not triggering on boot.
> I had to ssh into the board and run udevadm trigger to get symlinks
> created (see below)
> 
> root@dra7xx-evm:~# ls -l /dev/tty*
> crw-rw-rw-    1 root     tty         5,   0 Feb 17 12:43 /dev/tty
> crw--w----    1 root     tty         4,   0 Feb 17 12:43 /dev/tty0
> crw--w----    1 root     root        4,   1 Feb 17 12:59 /dev/tty1
> crw--w----    1 root     tty         4,  10 Feb 17 12:43 /dev/tty10
> crw--w----    1 root     tty         4,  11 Feb 17 12:43 /dev/tty11
> crw--w----    1 root     tty         4,  12 Feb 17 12:43 /dev/tty12
> crw--w----    1 root     tty         4,  13 Feb 17 12:43 /dev/tty13
> crw--w----    1 root     tty         4,  14 Feb 17 12:43 /dev/tty14
> crw--w----    1 root     tty         4,  15 Feb 17 12:43 /dev/tty15
> crw--w----    1 root     tty         4,  16 Feb 17 12:43 /dev/tty16
> crw--w----    1 root     tty         4,  17 Feb 17 12:43 /dev/tty17
> crw--w----    1 root     tty         4,  18 Feb 17 12:43 /dev/tty18
> crw--w----    1 root     tty         4,  19 Feb 17 12:43 /dev/tty19
> crw--w----    1 root     tty         4,   2 Feb 17 12:43 /dev/tty2
> crw--w----    1 root     tty         4,  20 Feb 17 12:43 /dev/tty20
> crw--w----    1 root     tty         4,  21 Feb 17 12:43 /dev/tty21
> crw--w----    1 root     tty         4,  22 Feb 17 12:43 /dev/tty22
> crw--w----    1 root     tty         4,  23 Feb 17 12:43 /dev/tty23
> crw--w----    1 root     tty         4,  24 Feb 17 12:43 /dev/tty24
> crw--w----    1 root     tty         4,  25 Feb 17 12:43 /dev/tty25
> crw--w----    1 root     tty         4,  26 Feb 17 12:43 /dev/tty26
> crw--w----    1 root     tty         4,  27 Feb 17 12:43 /dev/tty27
> crw--w----    1 root     tty         4,  28 Feb 17 12:43 /dev/tty28
> crw--w----    1 root     tty         4,  29 Feb 17 12:43 /dev/tty29
> crw--w----    1 root     tty         4,   3 Feb 17 12:43 /dev/tty3
> crw--w----    1 root     tty         4,  30 Feb 17 12:43 /dev/tty30
> crw--w----    1 root     tty         4,  31 Feb 17 12:43 /dev/tty31
> crw--w----    1 root     tty         4,  32 Feb 17 12:43 /dev/tty32
> crw--w----    1 root     tty         4,  33 Feb 17 12:43 /dev/tty33
> crw--w----    1 root     tty         4,  34 Feb 17 12:43 /dev/tty34
> crw--w----    1 root     tty         4,  35 Feb 17 12:43 /dev/tty35
> crw--w----    1 root     tty         4,  36 Feb 17 12:43 /dev/tty36
> crw--w----    1 root     tty         4,  37 Feb 17 12:43 /dev/tty37
> crw--w----    1 root     tty         4,  38 Feb 17 12:43 /dev/tty38
> crw--w----    1 root     tty         4,  39 Feb 17 12:43 /dev/tty39
> crw--w----    1 root     tty         4,   4 Feb 17 12:43 /dev/tty4
> crw--w----    1 root     tty         4,  40 Feb 17 12:43 /dev/tty40
> crw--w----    1 root     tty         4,  41 Feb 17 12:43 /dev/tty41
> crw--w----    1 root     tty         4,  42 Feb 17 12:43 /dev/tty42
> crw--w----    1 root     tty         4,  43 Feb 17 12:43 /dev/tty43
> crw--w----    1 root     tty         4,  44 Feb 17 12:43 /dev/tty44
> crw--w----    1 root     tty         4,  45 Feb 17 12:43 /dev/tty45
> crw--w----    1 root     tty         4,  46 Feb 17 12:43 /dev/tty46
> crw--w----    1 root     tty         4,  47 Feb 17 12:43 /dev/tty47
> crw--w----    1 root     tty         4,  48 Feb 17 12:43 /dev/tty48
> crw--w----    1 root     tty         4,  49 Feb 17 12:43 /dev/tty49
> crw--w----    1 root     tty         4,   5 Feb 17 12:43 /dev/tty5
> crw--w----    1 root     tty         4,  50 Feb 17 12:43 /dev/tty50
> crw--w----    1 root     tty         4,  51 Feb 17 12:43 /dev/tty51
> crw--w----    1 root     tty         4,  52 Feb 17 12:43 /dev/tty52
> crw--w----    1 root     tty         4,  53 Feb 17 12:43 /dev/tty53
> crw--w----    1 root     tty         4,  54 Feb 17 12:43 /dev/tty54
> crw--w----    1 root     tty         4,  55 Feb 17 12:43 /dev/tty55
> crw--w----    1 root     tty         4,  56 Feb 17 12:43 /dev/tty56
> crw--w----    1 root     tty         4,  57 Feb 17 12:43 /dev/tty57
> crw--w----    1 root     tty         4,  58 Feb 17 12:43 /dev/tty58
> crw--w----    1 root     tty         4,  59 Feb 17 12:43 /dev/tty59
> crw--w----    1 root     tty         4,   6 Feb 17 12:43 /dev/tty6
> crw--w----    1 root     tty         4,  60 Feb 17 12:43 /dev/tty60
> crw--w----    1 root     tty         4,  61 Feb 17 12:43 /dev/tty61
> crw--w----    1 root     tty         4,  62 Feb 17 12:43 /dev/tty62
> crw--w----    1 root     tty         4,  63 Feb 17 12:43 /dev/tty63
> crw--w----    1 root     tty         4,   7 Feb 17 12:43 /dev/tty7
> crw--w----    1 root     tty         4,   8 Feb 17 12:43 /dev/tty8
> crw--w----    1 root     tty         4,   9 Feb 17 12:43 /dev/tty9
> crw-rw----    1 root     dialout     4,  64 Feb 17 12:43 /dev/ttyS0
> crw-rw----    1 root     dialout     4,  65 Feb 17 12:43 /dev/ttyS1
> crw-rw----    1 root     dialout     4,  66 Feb 17 12:59 /dev/ttyS2
> crw-rw----    1 root     dialout     4,  67 Feb 17 12:43 /dev/ttyS3
> crw-rw----    1 root     dialout     4,  68 Feb 17 12:43 /dev/ttyS4
> crw-rw----    1 root     dialout     4,  69 Feb 17 12:43 /dev/ttyS5
> crw-rw----    1 root     dialout     4,  70 Feb 17 12:43 /dev/ttyS6
> crw-rw----    1 root     dialout     4,  71 Feb 17 12:43 /dev/ttyS7
> crw-rw----    1 root     dialout     4,  72 Feb 17 12:43 /dev/ttyS8
> crw-rw----    1 root     dialout     4,  73 Feb 17 12:43 /dev/ttyS9
> root@dra7xx-evm:~# udevadm trigger
> root@dra7xx-evm:~# ls -l /dev/tty*
> crw-rw-rw-    1 root     tty         5,   0 Feb 17 13:09 /dev/tty
> crw--w----    1 root     tty         4,   0 Feb 17 13:09 /dev/tty0
> crw--w----    1 root     tty         4,   1 Feb 17 13:09 /dev/tty1
> crw--w----    1 root     tty         4,  10 Feb 17 13:09 /dev/tty10
> crw--w----    1 root     tty         4,  11 Feb 17 13:09 /dev/tty11
> crw--w----    1 root     tty         4,  12 Feb 17 13:09 /dev/tty12
> crw--w----    1 root     tty         4,  13 Feb 17 13:09 /dev/tty13
> crw--w----    1 root     tty         4,  14 Feb 17 13:09 /dev/tty14
> crw--w----    1 root     tty         4,  15 Feb 17 13:09 /dev/tty15
> crw--w----    1 root     tty         4,  16 Feb 17 13:09 /dev/tty16
> crw--w----    1 root     tty         4,  17 Feb 17 13:09 /dev/tty17
> crw--w----    1 root     tty         4,  18 Feb 17 13:09 /dev/tty18
> crw--w----    1 root     tty         4,  19 Feb 17 13:09 /dev/tty19
> crw--w----    1 root     tty         4,   2 Feb 17 13:09 /dev/tty2
> crw--w----    1 root     tty         4,  20 Feb 17 13:09 /dev/tty20
> crw--w----    1 root     tty         4,  21 Feb 17 13:09 /dev/tty21
> crw--w----    1 root     tty         4,  22 Feb 17 13:09 /dev/tty22
> crw--w----    1 root     tty         4,  23 Feb 17 13:09 /dev/tty23
> crw--w----    1 root     tty         4,  24 Feb 17 13:09 /dev/tty24
> crw--w----    1 root     tty         4,  25 Feb 17 13:09 /dev/tty25
> crw--w----    1 root     tty         4,  26 Feb 17 13:09 /dev/tty26
> crw--w----    1 root     tty         4,  27 Feb 17 13:09 /dev/tty27
> crw--w----    1 root     tty         4,  28 Feb 17 13:09 /dev/tty28
> crw--w----    1 root     tty         4,  29 Feb 17 13:09 /dev/tty29
> crw--w----    1 root     tty         4,   3 Feb 17 13:09 /dev/tty3
> crw--w----    1 root     tty         4,  30 Feb 17 13:09 /dev/tty30
> crw--w----    1 root     tty         4,  31 Feb 17 13:09 /dev/tty31
> crw--w----    1 root     tty         4,  32 Feb 17 13:09 /dev/tty32
> crw--w----    1 root     tty         4,  33 Feb 17 13:09 /dev/tty33
> crw--w----    1 root     tty         4,  34 Feb 17 13:09 /dev/tty34
> crw--w----    1 root     tty         4,  35 Feb 17 13:09 /dev/tty35
> crw--w----    1 root     tty         4,  36 Feb 17 13:09 /dev/tty36
> crw--w----    1 root     tty         4,  37 Feb 17 13:09 /dev/tty37
> crw--w----    1 root     tty         4,  38 Feb 17 13:09 /dev/tty38
> crw--w----    1 root     tty         4,  39 Feb 17 13:09 /dev/tty39
> crw--w----    1 root     tty         4,   4 Feb 17 13:09 /dev/tty4
> crw--w----    1 root     tty         4,  40 Feb 17 13:09 /dev/tty40
> crw--w----    1 root     tty         4,  41 Feb 17 13:09 /dev/tty41
> crw--w----    1 root     tty         4,  42 Feb 17 13:09 /dev/tty42
> crw--w----    1 root     tty         4,  43 Feb 17 13:09 /dev/tty43
> crw--w----    1 root     tty         4,  44 Feb 17 13:09 /dev/tty44
> crw--w----    1 root     tty         4,  45 Feb 17 13:09 /dev/tty45
> crw--w----    1 root     tty         4,  46 Feb 17 13:09 /dev/tty46
> crw--w----    1 root     tty         4,  47 Feb 17 13:09 /dev/tty47
> crw--w----    1 root     tty         4,  48 Feb 17 13:09 /dev/tty48
> crw--w----    1 root     tty         4,  49 Feb 17 13:09 /dev/tty49
> crw--w----    1 root     tty         4,   5 Feb 17 13:09 /dev/tty5
> crw--w----    1 root     tty         4,  50 Feb 17 13:09 /dev/tty50
> crw--w----    1 root     tty         4,  51 Feb 17 13:09 /dev/tty51
> crw--w----    1 root     tty         4,  52 Feb 17 13:09 /dev/tty52
> crw--w----    1 root     tty         4,  53 Feb 17 13:09 /dev/tty53
> crw--w----    1 root     tty         4,  54 Feb 17 13:09 /dev/tty54
> crw--w----    1 root     tty         4,  55 Feb 17 13:09 /dev/tty55
> crw--w----    1 root     tty         4,  56 Feb 17 13:09 /dev/tty56
> crw--w----    1 root     tty         4,  57 Feb 17 13:09 /dev/tty57
> crw--w----    1 root     tty         4,  58 Feb 17 13:09 /dev/tty58
> crw--w----    1 root     tty         4,  59 Feb 17 13:09 /dev/tty59
> crw--w----    1 root     tty         4,   6 Feb 17 13:09 /dev/tty6
> crw--w----    1 root     tty         4,  60 Feb 17 13:09 /dev/tty60
> crw--w----    1 root     tty         4,  61 Feb 17 13:09 /dev/tty61
> crw--w----    1 root     tty         4,  62 Feb 17 13:09 /dev/tty62
> crw--w----    1 root     tty         4,  63 Feb 17 13:09 /dev/tty63
> crw--w----    1 root     tty         4,   7 Feb 17 13:09 /dev/tty7
> crw--w----    1 root     tty         4,   8 Feb 17 13:09 /dev/tty8
> crw--w----    1 root     tty         4,   9 Feb 17 13:09 /dev/tty9
> lrwxrwxrwx    1 root     root             5 Feb 17 13:09 /dev/ttyO0 -> ttyS0
> lrwxrwxrwx    1 root     root             5 Feb 17 13:09 /dev/ttyO2 -> ttyS2
> crw-rw----    1 root     dialout     4,  64 Feb 17 13:09 /dev/ttyS0
> crw-rw----    1 root     dialout     4,  65 Feb 17 13:09 /dev/ttyS1
> crw-rw----    1 root     dialout     4,  66 Feb 17 13:09 /dev/ttyS2
> crw-rw----    1 root     dialout     4,  67 Feb 17 13:09 /dev/ttyS3
> crw-rw----    1 root     dialout     4,  68 Feb 17 13:09 /dev/ttyS4
> crw-rw----    1 root     dialout     4,  69 Feb 17 13:09 /dev/ttyS5
> crw-rw----    1 root     dialout     4,  70 Feb 17 13:09 /dev/ttyS6
> crw-rw----    1 root     dialout     4,  71 Feb 17 13:09 /dev/ttyS7
> crw-rw----    1 root     dialout     4,  72 Feb 17 13:09 /dev/ttyS8
> crw-rw----    1 root     dialout     4,  73 Feb 17 13:09 /dev/ttyS9
> root@dra7xx-evm:~#
> 
> On 02/27/2015 07:48 AM, Carlos Hernandez wrote:
> >Acked-by: Carlos Hernandez <ceh@ti.com>
> >
> >On 02/26/2015 08:33 PM, Arago Project git wrote:
> >>Module: meta-ti
> >>Branch: master
> >>Commit: 4ce69eff28103778508d23af766e6204c95595d3
> >>URL: http://arago-project.org/git/meta-ti.git?a=commit;h=4ce69eff28103778508d23af766e6204c95595d3
> >>
> >>Author: Denys Dmytriyenko <denys@ti.com>
> >>Date:   Thu Feb 26 14:51:40 2015 -0500
> >>
> >>udev: rules for seamless transition to 8250_omap serial driver
> >>
> >>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >>
> >>---
> >>
> >>  recipes-core/udev/udev/omap-tty.rules |   17 +++++++++++++++++
> >>  recipes-core/udev/udev_%.bbappend     |    9 +++++++++
> >>  2 files changed, 26 insertions(+), 0 deletions(-)
> >>
> >>diff --git a/recipes-core/udev/udev/omap-tty.rules
> >>b/recipes-core/udev/udev/omap-tty.rules
> >>new file mode 100644
> >>index 0000000..989d60f
> >>--- /dev/null
> >>+++ b/recipes-core/udev/udev/omap-tty.rules
> >>@@ -0,0 +1,17 @@
> >>+# There are a number of modifiers that are allowed to be used in some
> >>+# of the different fields. They provide the following subsitutions:
> >>+#
> >>+# %n the "kernel number" of the device.
> >>+#    For example, 'sda3' has a "kernel number" of '3'
> >>+# %e the smallest number for that name which does not matches
> >>an existing node
> >>+# %k the kernel name for the device
> >>+# %M the kernel major number for the device
> >>+# %m the kernel minor number for the device
> >>+# %b the bus id for the device
> >>+# %c the string returned by the PROGRAM
> >>+# %s{filename} the content of a sysfs attribute
> >>+# %% the '%' char itself
> >>+#
> >>+
> >>+# Backward compatibility with old OMAP UART-style ttyO0 naming
> >>+SUBSYSTEM=="tty", ATTR{uartclk}!="0", KERNEL=="ttyS[0-9]",
> >>SYMLINK+="ttyO%n"
> >>diff --git a/recipes-core/udev/udev_%.bbappend
> >>b/recipes-core/udev/udev_%.bbappend
> >>new file mode 100644
> >>index 0000000..fd0d99b
> >>--- /dev/null
> >>+++ b/recipes-core/udev/udev_%.bbappend
> >>@@ -0,0 +1,9 @@
> >>+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >>+
> >>+SRC_URI_append = " file://omap-tty.rules"
> >>+
> >>+PR_append = ".0"
> >>+
> >>+do_install_append() {
> >>+    install -m 0644 ${WORKDIR}/omap-tty.rules
> >>${D}${sysconfdir}/udev/rules.d/
> >>+}
> >>
> >
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

