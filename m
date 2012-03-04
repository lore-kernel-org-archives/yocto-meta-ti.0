Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (hermes.mlbassoc.com [64.234.241.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9DA2E00746
	for <meta-ti@yoctoproject.org>; Sun,  4 Mar 2012 05:17:29 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 6646CF81245; Sun,  4 Mar 2012 06:17:29 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id B8669F811E8;
	Sun,  4 Mar 2012 06:17:27 -0700 (MST)
Message-ID: <4F536B67.2070009@mlbassoc.com>
Date: Sun, 04 Mar 2012 06:17:27 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <4F5213E8.50108@mlbassoc.com>
	<89B59491-7BDB-4A5D-BDC0-D4E3863E417B@dominion.thruhere.net>
	<4F5367ED.1060903@mlbassoc.com>
	<7AB88097-7498-4BEE-879A-D24894A4CB36@dominion.thruhere.net>
In-Reply-To: <7AB88097-7498-4BEE-879A-D24894A4CB36@dominion.thruhere.net>
Subject: Re: [Angstrom-devel] Can't build cloud9 image
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
X-List-Received-Date: Sun, 04 Mar 2012 13:17:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-03-04 06:09, Koen Kooi wrote:
>
> Op 4 mrt. 2012, om 14:02 heeft Gary Thomas het volgende geschreven:
>
>> On 2012-03-04 05:46, Koen Kooi wrote:
>>>
>>> Op 3 mrt. 2012, om 13:51 heeft Gary Thomas het volgende geschreven:
>>>
>>>> OE Build Configuration:
>>>> BB_VERSION        = "1.15.1"
>>>> TARGET_ARCH       = "arm"
>>>> TARGET_OS         = "linux-gnueabi"
>>>> MACHINE           = "beaglebone"
>>>> DISTRO            = "angstrom"
>>>> DISTRO_VERSION    = "v2012.03-core"
>>>> TUNE_FEATURES     = "armv7a vfp neon cortexa8"
>>>> TARGET_FPU        = "vfp-neon"
>>>> meta-angstrom     = "master:2129eed920364abcc4f3f72d395333a041634e26"
>>>> meta-oe
>>>> meta-efl
>>>> meta-gpe
>>>> meta-gnome
>>>> meta-xfce
>>>> meta-initramfs    = "master:fdff8697ea2db6254d26510adb7d11e6352d950f"
>>>> meta-opie         = "master:efa3892b20a4ef80274e56e5633ebd62c16f9731"
>>>> meta-java         = "master:d430de31c167cd264be74a1d82af4b732bb915dd"
>>>> meta-mozilla      = "master:5737d9fa26a632a27b2aa760c0d01190f0a17d0e"
>>>> meta-ti           = "master:020b6f893d13e36bccd7a2d8e6a0e6ab5e602450"
>>>> meta-efikamx      = "master:2c09a3a780b23448e8a6ca964256ff7f5ccba65d"
>>>> meta-nslu2        = "master:3d9fc951b05b4df476374b6fc3085ebac7f293ee"
>>>> meta-htc
>>>> meta-nokia
>>>> meta-openmoko
>>>> meta-palm         = "master:cda19686a2a3573ce50c86733c3469d926124995"
>>>> meta-handheld     = "master:fa1e6dcb524eb7ed29a6cd971a150d35c31e96e7"
>>>> meta-intel
>>>> meta-sugarbay
>>>> meta-crownbay
>>>> meta-emenlow
>>>> meta-fishriver
>>>> meta-jasperforest
>>>> meta-n450         = "master:df18b721f86f0737c0f302e49b27ea232c70e683"
>>>> meta              = "master:b24d4bcde21b013e48eaffea5f3a70d8b1df1047"
>>>>
>>>> Building of cloud9-image ends up with this error:
>>>>   /etc/fstab entries need to be created with the user flag for the loop devices like:
>>>>   /dev/loop2 /local/new-angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/cloud9-image-1.0-r0/tmp-mnt-boot vfat user 0 0
>>>>
>>>> My host is Fedora-16 (i386)
>>>>
>>>> How do I solve this so I can build the full cloud9-image?
>>>
>>> At the risk of responding to a practical joke: /etc/fstab entries need to be created with the user flag for the loop devices, the error message even includes the exact entry you need to add.
>>
>> I see that, but what if I'm "Joe user" who can't (or doesn't want to)
>> edit /etc/fstab?
>
> Then you can't build this image.
>
>>   Everything else builds with no special "root" style
>> privileges, why does this one image need it?
>
> Simply put: because the tools suck. A this point in time there is no tool (or tools plural) that allows creating 2 partitions (vfat and extX) and concatenating them into a valid image with an MBR. The biggest lack is something like 'genfatfs', mcopy is a step in the right direction but is too limited to work in this scenario.
> And genext2fs will likely OOM on a lot of buildmachines.

But this is just to be able to generate a packed image that can be
copied directly to media?  Maybe that should be a different image
type, like the .u-boot images?  Then it would be obvious what's
being done and why.  In my case, I'm more than happy running a script
to copy the appropriate files to my SD card, etc. and I don't care
(nor especially want) a packed image.

>
>>   Also, what if I build
>> in another tree/path?  Now, I have to edit /etc/fstab again?
>
> Correct, it's the gift that keeps on giving :(
>
> Anyway, why are you posting this to the angstrom list? The cloud9 recipe and offending bbclass live in meta-ti.

Fair enough, I'll try to keep the discussions where they are most relevant.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

