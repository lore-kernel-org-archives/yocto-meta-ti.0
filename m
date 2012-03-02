Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (hermes.mlbassoc.com [64.234.241.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 693DEE003E4
	for <meta-ti@yoctoproject.org>; Fri,  2 Mar 2012 06:56:02 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id AF368F81214; Fri,  2 Mar 2012 07:56:01 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id C8D4BF81213;
	Fri,  2 Mar 2012 07:56:00 -0700 (MST)
Message-ID: <4F50DF80.10703@mlbassoc.com>
Date: Fri, 02 Mar 2012 07:56:00 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Can't build for BeagleBone
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
X-List-Received-Date: Fri, 02 Mar 2012 14:56:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

In a freshly updated Angstrom tree:
OE Build Configuration:
BB_VERSION        = "1.15.1"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beaglebone"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2012.03-core"
TUNE_FEATURES     = "armv7a vfp neon cortexa8"
TARGET_FPU        = "vfp-neon"
meta-angstrom     = "master:2129eed920364abcc4f3f72d395333a041634e26"
meta-oe
meta-efl
meta-gpe
meta-gnome
meta-xfce
meta-initramfs    = "master:fdff8697ea2db6254d26510adb7d11e6352d950f"
meta-opie         = "master:efa3892b20a4ef80274e56e5633ebd62c16f9731"
meta-java         = "master:d430de31c167cd264be74a1d82af4b732bb915dd"
meta-ti           = "master:2dbb7f09bf1c54d505d2e84a3a614bc5ca9b89aa"
meta-efikamx      = "master:2c09a3a780b23448e8a6ca964256ff7f5ccba65d"
meta-nslu2        = "master:3d9fc951b05b4df476374b6fc3085ebac7f293ee"
meta-htc
meta-nokia
meta-openmoko
meta-palm         = "master:cda19686a2a3573ce50c86733c3469d926124995"
meta-handheld     = "master:fa1e6dcb524eb7ed29a6cd971a150d35c31e96e7"
meta-intel
meta-sugarbay
meta-crownbay
meta-emenlow
meta-fishriver
meta-jasperforest
meta-n450         = "master:df18b721f86f0737c0f302e49b27ea232c70e683"
meta              = "master:d94cb18f7f17a492c7a948337d7d2d1d0785573f"

% MACHINE="beaglebone" bitbake cloud9-image
   ...
| cp: cannot stat `/local/new-angstrom/sources/meta-ti/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/./configs/*': No such file or directory
| ERROR: Function failed: Unpack failure for URL: 'file://configs/*'. Unpack command 
PATH="/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/beaglebone/usr/bin/crossscripts:/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/sbin:/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/usr/bin:/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux/sbin:/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/i686-linux//bin:/local/new-angstrom/sources/openembedded-core/scripts:/local/new-angstrom/sources/bitbake/bin:/usr/lib/ccache:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/gthomas/bin:/local/new-angstrom/sources/openembedded-core/scripts" 
cp /local/new-angstrom/sources/meta-ti/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/./configs/* 
/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/linux-ti33x-psp-3.2-r4c+gitr09e9651bcf2ee8d86685f2a8075bc6557b1d3b91/configs/ failed 
with return value 1
NOTE: package linux-ti33x-psp-3.2-r4c+gitr09e9651bcf2ee8d86685f2a8075bc6557b1d3b91: task do_unpack: Failed

Did I miss something?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

