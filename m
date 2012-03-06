Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (hermes.mlbassoc.com [64.234.241.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F418BE004D2
	for <meta-ti@yoctoproject.org>; Tue,  6 Mar 2012 07:02:58 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 6A7F5F81277; Tue,  6 Mar 2012 08:02:58 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 36FEAF8121F;
	Tue,  6 Mar 2012 08:02:57 -0700 (MST)
Message-ID: <4F562721.7010808@mlbassoc.com>
Date: Tue, 06 Mar 2012 08:02:57 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: Can't build a working image
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
X-List-Received-Date: Tue, 06 Mar 2012 15:02:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'll try this list since my questions on the Angstrom list seem
to go mostly unanswered...

Using a recent checkout (late 2012-03-05), building 100% from
scratch, if I build
   % MACHINE="beaglebone" bitbake systemd-image
I get this when it [fails to] boot:

   Starting Journal Service...
   Failed to start Journal Service                                        [FAILED]
   See 'systemctl status systemd-journald.service' for details.
   Dependency failed. Aborted start of Serial Getty on ttyO0              [ ABORT]
   Dependency failed. Aborted start of Getty on tty1                      [ ABORT]

So I'm stuck - it won't come up no matter what I try and I can't
check the logs because it doesn't come up...

Any ideas what I've done wrong?

OE Build Configuration:
BB_VERSION        = "1.15.1"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beaglebone"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2012.03-core"
TUNE_FEATURES     = "armv7a vfp neon cortexa8"
TARGET_FPU        = "vfp-neon"
meta-angstrom     = "master:51ba0dd081af1d7de56ffc9fb318044bc3c7c47e"
meta-oe
meta-efl
meta-gpe
meta-gnome
meta-xfce
meta-initramfs    = "master:b5bb9a5b26d6a94d5b91aae2fae17d9b9ab6dfeb"
meta-opie         = "master:efa3892b20a4ef80274e56e5633ebd62c16f9731"
meta-java         = "master:d430de31c167cd264be74a1d82af4b732bb915dd"
meta-mozilla      = "master:5737d9fa26a632a27b2aa760c0d01190f0a17d0e"
meta-ti           = "master:43956e56dba61709a4b01bb4ed6c4a28cef19d30"
meta-efikamx      = "master:2c09a3a780b23448e8a6ca964256ff7f5ccba65d"
meta-nslu2        = "master:3d9fc951b05b4df476374b6fc3085ebac7f293ee"
meta-htc
meta-nokia
meta-openmoko
meta-palm         = "master:c38a39a29545b5488b77eb11d795ef5d77b46975"
meta-handheld     = "master:fa1e6dcb524eb7ed29a6cd971a150d35c31e96e7"
meta-intel
meta-sugarbay
meta-crownbay
meta-emenlow
meta-fishriver
meta-jasperforest
meta-n450         = "master:87f409827684e39484900a20531c8a14c0cb91e6"
meta              = "master:d7b8c247227f3cc82f92292407f548927e9fde78"

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

