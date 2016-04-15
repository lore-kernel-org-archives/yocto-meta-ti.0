Return-Path: <lists@webconect.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BA55FE00E62; Fri, 15 Apr 2016 07:45:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [217.26.49.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mxout015.mail.hostpoint.ch (mxout015.mail.hostpoint.ch
	[217.26.49.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EAC38E00C49
	for <meta-ti@yoctoproject.org>; Fri, 15 Apr 2016 07:45:13 -0700 (PDT)
Received: from [10.0.2.46] (helo=asmtp013.mail.hostpoint.ch)
	by mxout015.mail.hostpoint.ch with esmtp (Exim 4.84 (FreeBSD))
	(envelope-from <lists@webconect.ch>)
	id 1ar4zf-000L7L-Tm; Fri, 15 Apr 2016 16:45:11 +0200
Received: from 77-58-230-166.dclient.hispeed.ch ([77.58.230.166]
	helo=webconect.local) by asmtp013.mail.hostpoint.ch with esmtpsa
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.84 (FreeBSD))
	(envelope-from <lists@webconect.ch>)
	id 1ar4zf-0007OE-RL; Fri, 15 Apr 2016 16:45:11 +0200
X-Authenticated-Sender-Id: lists@webconect.ch
Date: Fri, 15 Apr 2016 16:46:05 +0200
From: Elias Diem <lists@webconect.ch>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20160415144605.GA3517@webconect.local>
References: <20160410170138.GA3694@webconect.local>
	<20160410193151.GJ16135@denix.org>
MIME-Version: 1.0
In-Reply-To: <20160410193151.GJ16135@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: Problem with libdrm.inc or eudev_%.bbappend
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
X-List-Received-Date: Fri, 15 Apr 2016 14:45:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hi Denys

On 2016-04-10, Denys Dmytriyenko wrote:

>On Sun, Apr 10, 2016 at 07:01:38PM +0200, Elias Diem wrote:
>> Hi
>>
>> I'm trying to build a layer[1] and experience some problems.
>>
>> Steps to reproduce:
>>
>> - I source `oe-init-build-env` like this:
>>  $ . /path/to/oe-init-build-env builddir
>>
>> - Then inside builddir, I change the two files `local.conf`  and
>> `bblayers.conf`. These two files are attached.
>>
>> - Then I start bitbake as follows:
>>
>>  $ bitbake mume-image
>>
>>  This will produce the following warning:
>>
>>  WARNING: Host distribution "Gentoo" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
>>
>>  And then it will produce the following error message:
>>
>>  ERROR: ParseError at /home/edi/var/yocto/meta-ti/recipes-graphics/drm/libdrm_2.4.41.bb:1: Could not include required file recipes-graphics/drm/libdrm.inc
>>
>>  The layer's README[2] tells me to use the branch `fido`  for
>> meta-ti. Apparently this branch does not contain a  file named
>> `libdrm.inc`.
>
>Well, and it shouldn't - in fido that file comes from oe-core. Looks like you
>are trying to mix/match different branches, which won't work. If you want
>fido, you have to use fido across the layers.

Thank you for your reply. This makes sense.

>> - I then change the meta-ti's branch to `master`. This  branch
>> contains the file `libdrm.inc`. I start bitbake  again:
>>
>>  $ bitbake mume-image
>>
>>  This will produce a new error:
>>
>>  ERROR: No recipes available for:
>>    /home/edi/var/yocto/meta-ti/recipes-core/udev/eudev_%.bbappend
>
>Two things - it was already fixed almost 2 weeks ago, so you seem to be using
>outdated snapshot. Second, use distro that doesn't error out on unused
>bbappends...
>
>And then again, you are trying to mix/match different branches of layers, so
>you might have some other weird issues down the road.

I use a workaround for now. I indeed mix the branches. But I 
delete the recipe `libdrm_2.4.41.bb` because I don't need 
libdrm.

Maybe I will find a nicer way to solve this problem in the 
future.

-- 
Greetings
Elias



