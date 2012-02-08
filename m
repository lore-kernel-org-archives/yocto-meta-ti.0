Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BDF48E004D2
	for <meta-ti@yoctoproject.org>; Wed,  8 Feb 2012 14:18:15 -0800 (PST)
Received: by werf1 with SMTP id f1so995440wer.35
	for <meta-ti@yoctoproject.org>; Wed, 08 Feb 2012 14:18:14 -0800 (PST)
Received: by 10.180.83.97 with SMTP id p1mr32587556wiy.19.1328739494838;
	Wed, 08 Feb 2012 14:18:14 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm2869539wib.1.2012.02.08.14.18.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Feb 2012 14:18:14 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F32F31B.2000303@gmail.com>
Date: Wed, 8 Feb 2012 23:18:13 +0100
Message-Id: <59EDC5ED-F339-48E8-8C4D-7137C23927CD@dominion.thruhere.net>
References: <4F32F016.4020008@gmail.com> <4F32F1B3.8090000@mlbassoc.com>
	<4F32F31B.2000303@gmail.com>
To: jfabernathy <jfabernathy@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: building Yocto for Pandaboard
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
X-List-Received-Date: Wed, 08 Feb 2012 22:18:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 feb. 2012, om 23:11 heeft jfabernathy het volgende geschreven:

> On 02/08/2012 05:05 PM, Gary Thomas wrote:
>> On 2012-02-08 14:58, jfabernathy wrote:
>>> I'm trying to build the pandaboard BSP for Yocto. I cloned the =
meta-ti repository in the poky directory and tried to build =
core-image-sato for both machine pandaboard and
>>> omap4430-panda. However, I immediately get an error because bitbake =
is looking for recipes-images/angstrom/systemd-image.bb, which is =
required in the ti-hw-bringup-image.bb image
>>> recipe.
>>>=20
>>> All I really included was the machine name change in local.conf and =
added the meta-ti layer in bblayers.conf.
>>>=20
>>> Did I miss a step?
>>=20
>> This was discussed last week.  Add this line to your local.conf
>>  BBMASK =3D ".*/meta-ti/recipes-misc/"
>> This will skip some BeagleBoard/BeagleBone recipes that are not
>> currently working in a Yocto tree.
>>=20
> Thanks a bunch. That got it going.  The README said nothing

Stop spreading such lies!

koen@dominion:/OE/tentacle/sources/meta-ti$ cat README=20
This layer depends on:

URI: git://git.openembedded.org/openembedded-core
branch: master
revision: HEAD

URI: git://git.angstrom-distribution.org/meta-angstrom
branch: master
revision: HEAD

URI: git://git.openembedded.org/meta-openembedded
branch: master
revision: HEAD

It is recommended to follow the instructions at =
http://www.angstrom-distribution.org/building-angstrom

This will set it up for the OpenEmbedded-core layout instead of the old
OpenEmbedded-dev layout. You can optionally tweak sources/layers.txt and =
conf/bblayers.conf to (de)select BSP layers.

Send pull requests to meta-ti@yoctoproject.org

Main layer maintainers: Denys Dmytriyenko <denys@ti.com>
                        Koen Kooi <k-kooi@ti.com>



