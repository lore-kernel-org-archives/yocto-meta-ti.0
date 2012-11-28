Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2800EE00294
	for <meta-ti@yoctoproject.org>; Wed, 28 Nov 2012 11:57:44 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 1193EF811FD; Wed, 28 Nov 2012 12:57:42 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 28E09F811DC;
	Wed, 28 Nov 2012 12:57:41 -0700 (MST)
Message-ID: <50B66CDF.9050405@mlbassoc.com>
Date: Wed, 28 Nov 2012 12:58:23 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <50B64752.6080607@mlbassoc.com> <20121128171902.GB7172@edge>
	<50B649FB.30609@mlbassoc.com>
	<CAOT3miJFxSCs7yPRr2xZ-Wc51YFF7KAS_SQMeQoN43rDFDuPqw@mail.gmail.com>
	<20121128173412.GC7172@edge>
In-Reply-To: <20121128173412.GC7172@edge>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Can't build recipes-graphics/xorg-xserver/xf86-video-omap_git.bb
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
X-List-Received-Date: Wed, 28 Nov 2012 19:57:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-11-28 10:34, Denys Dmytriyenko wrote:
> On Wed, Nov 28, 2012 at 06:31:17PM +0100, Nicolas Dechesne wrote:
>> Le 28 nov. 2012 18:28, "Gary Thomas" <gary@mlbassoc.com> a ?crit :
>>>
>>> On 2012-11-28 10:19, Denys Dmytriyenko wrote:
>>>>
>>>> http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/1196
>>>
>>>
>>> Bottom line: I should just use the latest Poky/Yocto tree?  I just updated
>>> the meta-ti(master) and the quoted patches don't seem to have been applied
>>> (the xf86-video-omap_git.bb is still present)
>>>
>>
>> Indeed you need to apply them for now. Denys should be merging them soon.
>> But a tested-by won't hurt...
>
> They just been merged. Had a slight delay testing the master branch - too much
> time spent dealing with denzil-based releases here from multiple teams... :(

Sadly, it's still breaking when I build using the latest:

checking whether to include DRI support... checking for /usr/include/xorg/dri.h... configure: error: cannot check for file existence when cross compiling
Configure failed. The contents of all config.log files follows to aid debugging
/home/local/p82_poky/tmp/work/armv7ahf-vfp-neon-amltd-linux-gnueabi/xf86-video-omap/2_0.4.2+gitr9+653ccadb38c87be565df3fbf2ff24a0cbe5a5e98-r20.1/git/config.log
This file contains any messages produced by compilers while
running configure, to aid debugging if configure makes a mistake.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

