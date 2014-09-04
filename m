Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0B41AE007C1; Thu,  4 Sep 2014 03:55:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [173.201.192.234 listed in list.dnswl.org]
Received: from p3plsmtpa07-05.prod.phx3.secureserver.net
	(p3plsmtpa07-05.prod.phx3.secureserver.net [173.201.192.234])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BAA0E0079A
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 03:55:55 -0700 (PDT)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-05.prod.phx3.secureserver.net with 
	id myvt1o00E1mTNtu01yvu9o; Thu, 04 Sep 2014 03:55:55 -0700
Message-ID: <54084539.9040103@pabigot.com>
Date: Thu, 04 Sep 2014 05:55:53 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <5407C780.5040801@pabigot.com>
	<CAMKF1srA8gnfNF+myYTSm+VHjBeGCWwAC22y2OmrKYnkJffuQg@mail.gmail.com>
In-Reply-To: <CAMKF1srA8gnfNF+myYTSm+VHjBeGCWwAC22y2OmrKYnkJffuQg@mail.gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: poor performance of OpenEmbedded on BeagleBoneBlack compared to Debian
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
X-List-Received-Date: Thu, 04 Sep 2014 10:55:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2014 12:39 AM, Khem Raj wrote:
> On Wed, Sep 3, 2014 at 6:59 PM, Peter A. Bigot <pab@pabigot.com> wrote:
>> debian@beaglebone:~$ g++ -Ofast -mfloat-abi=hard -o card card.cpp
>>    debian@beaglebone:~$ time ./card > /dev/null
>>    real    4m54.846s
>>    user    4m54.627s
>>    sys     0m0.057s
>>
>> With poky master + meta-ti it runs this fast:
>>
>>    root@beaglebone:~# time ./card > /dev/null
>>    real    9m37.901s
>>    user    9m37.200s
>>    sys     0m0.150s
>
> you should enable hardfloat ABI for poky as well for this kind of load.

Yeah, I remember that from the big argument back in oe-core, but what's 
lacking in all that is any revelation of exactly how to do that.

The poky build using meta-ti's BSP for beaglebone puts gcc and 
gcc-runtime into cortexa8t2hf-vfp-neon-poky-linux-gnueabi which AFAICT 
is supposed to be hard-float.

-mfloat-abi=hard is being passed when gcc-runtime is built, and when the 
application is built.

What toolchain-build or runtime-build enables hardfloat if that isn't 
already being done?

Peter

