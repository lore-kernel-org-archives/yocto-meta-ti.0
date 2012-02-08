Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (hermes.mlbassoc.com [64.234.241.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B66AEE004D2
	for <meta-ti@yoctoproject.org>; Wed,  8 Feb 2012 14:20:49 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 74EA4F8123B; Wed,  8 Feb 2012 15:20:49 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 70A6AF81207;
	Wed,  8 Feb 2012 15:20:43 -0700 (MST)
Message-ID: <4F32F53B.5020407@mlbassoc.com>
Date: Wed, 08 Feb 2012 15:20:43 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <4F32F016.4020008@gmail.com> <4F32F1B3.8090000@mlbassoc.com>
	<4F32F31B.2000303@gmail.com>
In-Reply-To: <4F32F31B.2000303@gmail.com>
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
X-List-Received-Date: Wed, 08 Feb 2012 22:20:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-02-08 15:11, jfabernathy wrote:
> On 02/08/2012 05:05 PM, Gary Thomas wrote:
>> On 2012-02-08 14:58, jfabernathy wrote:
>>> I'm trying to build the pandaboard BSP for Yocto. I cloned the meta-ti repository in the poky directory and tried to build core-image-sato for both machine pandaboard and
>>> omap4430-panda. However, I immediately get an error because bitbake is looking for recipes-images/angstrom/systemd-image.bb, which is required in the ti-hw-bringup-image.bb image
>>> recipe.
>>>
>>> All I really included was the machine name change in local.conf and added the meta-ti layer in bblayers.conf.
>>>
>>> Did I miss a step?
>>
>> This was discussed last week. Add this line to your local.conf
>> BBMASK = ".*/meta-ti/recipes-misc/"
>> This will skip some BeagleBoard/BeagleBone recipes that are not
>> currently working in a Yocto tree.
>>
> Thanks a bunch. That got it going. The README said nothing, so I'm glad you jumped in with this hint. I just joined the meta-ti mailing list today.

The README assumes you want to build using Angstrom.  I've found that
with only a little extra care, you can use this layer just fine with
Yocto.

As for the meta-ti mailing list, it hasn't seen much of anything except
discussions about how to manage the layer.  Certainly not user-level
questions like this.  Also, my mention of BBMASK was on the Yocto list :-)

>
> I know I'm going to need a pointer to how to put the yocto image on an SDcard. I would assume it's similar to how you put ubuntu or angstrom??

You can use (or adapt) this script http://angstrom.s3.amazonaws.com/demo/beagleboard/mkcard.txt

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

