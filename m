Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (hermes.mlbassoc.com [64.234.241.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25DC4E004D2
	for <meta-ti@yoctoproject.org>; Wed,  8 Feb 2012 14:22:29 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id CA83FF8123F; Wed,  8 Feb 2012 15:22:28 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 73F05F81207;
	Wed,  8 Feb 2012 15:22:19 -0700 (MST)
Message-ID: <4F32F59B.7010804@mlbassoc.com>
Date: Wed, 08 Feb 2012 15:22:19 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <4F32F016.4020008@gmail.com> <4F32F1B3.8090000@mlbassoc.com>
	<4F32F31B.2000303@gmail.com>
	<59EDC5ED-F339-48E8-8C4D-7137C23927CD@dominion.thruhere.net>
In-Reply-To: <59EDC5ED-F339-48E8-8C4D-7137C23927CD@dominion.thruhere.net>
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
X-List-Received-Date: Wed, 08 Feb 2012 22:22:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-02-08 15:18, Koen Kooi wrote:
>
> Op 8 feb. 2012, om 23:11 heeft jfabernathy het volgende geschreven:
>
>> On 02/08/2012 05:05 PM, Gary Thomas wrote:
>>> On 2012-02-08 14:58, jfabernathy wrote:
>>>> I'm trying to build the pandaboard BSP for Yocto. I cloned the meta-ti repository in the poky directory and tried to build core-image-sato for both machine pandaboard and
>>>> omap4430-panda. However, I immediately get an error because bitbake is looking for recipes-images/angstrom/systemd-image.bb, which is required in the ti-hw-bringup-image.bb image
>>>> recipe.
>>>>
>>>> All I really included was the machine name change in local.conf and added the meta-ti layer in bblayers.conf.
>>>>
>>>> Did I miss a step?
>>>
>>> This was discussed last week.  Add this line to your local.conf
>>>   BBMASK = ".*/meta-ti/recipes-misc/"
>>> This will skip some BeagleBoard/BeagleBone recipes that are not
>>> currently working in a Yocto tree.
>>>
>> Thanks a bunch. That got it going.  The README said nothing
>
> Stop spreading such lies!

It's not a lie, just a perspective.  Not everyone wants to run Angstrom,
but they might want to use the TI layer (kernels, DSP support, etc)

>
> koen@dominion:/OE/tentacle/sources/meta-ti$ cat README
> This layer depends on:
>
> URI: git://git.openembedded.org/openembedded-core
> branch: master
> revision: HEAD
>
> URI: git://git.angstrom-distribution.org/meta-angstrom
> branch: master
> revision: HEAD
>
> URI: git://git.openembedded.org/meta-openembedded
> branch: master
> revision: HEAD
>
> It is recommended to follow the instructions at http://www.angstrom-distribution.org/building-angstrom
>
> This will set it up for the OpenEmbedded-core layout instead of the old
> OpenEmbedded-dev layout. You can optionally tweak sources/layers.txt and conf/bblayers.conf to (de)select BSP layers.
>
> Send pull requests to meta-ti@yoctoproject.org
>
> Main layer maintainers: Denys Dmytriyenko<denys@ti.com>
>                          Koen Kooi<k-kooi@ti.com>
>
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

