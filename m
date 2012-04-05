Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (hermes.mlbassoc.com [64.234.241.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14475E0044A
	for <meta-ti@yoctoproject.org>; Thu,  5 Apr 2012 08:42:29 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 682B5F8124B; Thu,  5 Apr 2012 09:42:28 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2C05DF811F0;
	Thu,  5 Apr 2012 09:42:27 -0600 (MDT)
Message-ID: <4F7DBD63.1060105@mlbassoc.com>
Date: Thu, 05 Apr 2012 09:42:27 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <4F7C7174.8090103@mlbassoc.com> <4F7CB454.1050709@mlbassoc.com>
In-Reply-To: <4F7CB454.1050709@mlbassoc.com>
Subject: Re: Can't build ti-dmai
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
X-List-Received-Date: Thu, 05 Apr 2012 15:42:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-04-04 14:51, Gary Thomas wrote:
> On 2012-04-04 10:06, Gary Thomas wrote:
>> Trying to build ti-dmai gives this error:
>> ERROR: Function failed: do_install (see
>> /local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-dmai-1_2_10_00_01+svnr642-r118o/temp/log.do_install.21360 for further information)
>> ERROR: Logfile of failure stored in:
>> /local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-dmai-1_2_10_00_01+svnr642-r118o/temp/log.do_install.21360
>> Log data follows:
>> | ERROR: Function failed: do_install (see
>> /local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-dmai-1_2_10_00_01+svnr642-r118o/temp/log.do_install.21360 for further information)
>> | make -C ./packages/ti/sdo/dmai install
>> | make[1]: Entering directory
>> `/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-dmai-1_2_10_00_01+svnr642-r118o/trunk/davinci_multimedia_application_interface/dmai_2_10_00_01+svnr642/dmai/packages/ti/sdo/dmai'
>>
>>
>> | make[1]: Nothing to be done for `install'.
>> | make[1]: Leaving directory
>> `/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-dmai-1_2_10_00_01+svnr642-r118o/trunk/davinci_multimedia_application_interface/dmai_2_10_00_01+svnr642/dmai/packages/ti/sdo/dmai'
>>
>>
>> | make -C ./packages/ti/sdo/dmai/apps install
>> | make[1]: Entering directory
>> `/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-dmai-1_2_10_00_01+svnr642-r118o/trunk/davinci_multimedia_application_interface/dmai_2_10_00_01+svnr642/dmai/packages/ti/sdo/dmai/apps'
>>
>>
>> |
>> | Executing make in subdirectory Makefile...
>> | make: Entering an unknown directory
>> | make: *** Makefile: Not a directory. Stop.
>> | make: Leaving an unknown directory
>> | make[1]: *** [Makefile] Error 2
>> | make[1]: Leaving directory
>> `/local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-dmai-1_2_10_00_01+svnr642-r118o/trunk/davinci_multimedia_application_interface/dmai_2_10_00_01+svnr642/dmai/packages/ti/sdo/dmai/apps'
>>
>>
>> | make: *** [install] Error 2
>> NOTE: package ti-dmai-1_2_10_00_01+svnr642-r118o: task do_install: Failed
>> ERROR: Task 3 (/local/new-angstrom/sources/meta-ti/recipes-ti/dmai/ti-dmai_svn.bb, do_install) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 1134 tasks of which 783 didn't need to be rerun and 1 failed.
>>
>> Summary: 1 task failed:
>> /local/new-angstrom/sources/meta-ti/recipes-ti/dmai/ti-dmai_svn.bb, do_install
>>
>> I'm using this configuration (up to date):
>> OE Build Configuration:
>> BB_VERSION = "1.15.1"
>> TARGET_ARCH = "arm"
>> TARGET_OS = "linux-gnueabi"
>> MACHINE = "beagleboard"
>> DISTRO = "angstrom"
>> DISTRO_VERSION = "v2012.04-core"
>> TUNE_FEATURES = "armv7a vfp neon cortexa8"
>> TARGET_FPU = "vfp-neon"
>> meta-angstrom = "master:6e986067a5b5be696c0115c6b4395f21cb6d771a"
>> meta-oe
>> toolchain-layer
>> meta-efl
>> meta-gpe
>> meta-gnome
>> meta-xfce
>> meta-initramfs = "master:d248ea6ada38ba9070f45f4fd2ab107bc6ed0246"
>> meta-opie = "master:efa3892b20a4ef80274e56e5633ebd62c16f9731"
>> meta-java = "master:3e8579a967664c0e4b6f047c70f6893b72dc9573"
>> meta-mozilla = "master:5737d9fa26a632a27b2aa760c0d01190f0a17d0e"
>> meta-ti = "master:246cb75a970e9aab0a3974a55e72c6d90f1df151"
>> meta-efikamx = "master:2c09a3a780b23448e8a6ca964256ff7f5ccba65d"
>> meta-nslu2 = "master:3d9fc951b05b4df476374b6fc3085ebac7f293ee"
>> meta-htc
>> meta-nokia
>> meta-openmoko
>> meta-palm = "master:ba34166f4565b52209adea82cef196615cf82246"
>> meta-handheld = "master:df6d514ae413f131e95d0f0c6c3b6792a006d451"
>> meta-intel
>> meta-sugarbay
>> meta-crownbay
>> meta-emenlow
>> meta-fishriver
>> meta-jasperforest
>> meta-n450 = "master:f89405e115d73426c8a6450b6e795b5885d6bdf3"
>> meta = "master:1634d736c55f767fe82a46bbb7f83c32006fece9"
>>
>> Any ideas/pointers?
>>
>
> This line in the Makefile is getting strange/different results:
> SUBDIRS = $(sort $(dir $(wildcard */)))
>
> I've found the weirdness, but I don't understand what's going on. I changed
> the Makefile to print $(SUBDIRS) to try and figure it out.
>
> When bitbake runs make in
> /local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-linux-gnueabi/ti-dmai-1_2_10_00_01+svnr642-r118o/trunk/davinci_multimedia_application_interface/dmai_2_10_00_01+svnr642/dmai/packages/ti/sdo/dmai/apps
>
> the result is
> Makefile.app/ Makefile/ Makefile~/ app_common.cfg/ app_common.tci/ audio_decode1/ audio_decode_io/ audio_decode_io1/ audio_encode1/ audio_encode_io1/ dmai.gel/ fc_common.cfg/
> image_decode_io/ image_decode_io1/ image_encode_io/ image_encode_io1/ speech_decode1/ speech_decode_io1/ speech_encode1/ speech_encode_io1/ video_decode_io/ video_decode_io2/
> video_display/ video_encode_io/ video_encode_io1/ video_encode_io_multich1/ video_loopback/ video_loopback_blend/ video_loopback_convert/ video_loopback_copy/ video_loopback_resize/
>
> the real result should be
> audio_decode1/ audio_decode_io/ audio_decode_io1/ audio_encode1/ audio_encode_io1/ image_decode_io/ image_decode_io1/ image_encode_io/ image_encode_io1/ speech_decode1/
> speech_decode_io1/ speech_encode1/ speech_encode_io1/ video_decode_io/ video_decode_io2/ video_display/ video_encode_io/ video_encode_io1/ video_encode_io_multich1/ video_loopback/
> video_loopback_blend/ video_loopback_convert/ video_loopback_copy/ video_loopback_resize/
>
> which I get if I execute make in that directory maually! The bitbake build
> is failing because files are being treated as directories (listed in $(SUBDIRS))
>
> Can someone explain this? I also had the Makefile print the
> value of $(MAKE) and it's always /usr/bin/make

It seems to be a bug (or change in behaviour) in make 3.82 which
is on Fedora 16.  When I use make 3.81, the build succeeds.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

