Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CD243E0076C; Thu,  4 Sep 2014 10:50:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [173.201.192.235 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from p3plsmtpa07-06.prod.phx3.secureserver.net
	(p3plsmtpa07-06.prod.phx3.secureserver.net [173.201.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D54A4E006EF
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 10:50:08 -0700 (PDT)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-06.prod.phx3.secureserver.net with 
	id n5q51o00S1mTNtu015q67q; Thu, 04 Sep 2014 10:50:07 -0700
Message-ID: <5408A64D.8020806@pabigot.com>
Date: Thu, 04 Sep 2014 12:50:05 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <a46afa0b8d064471ae32a8078631d962@mb.cognitivesystems.com>	<20140904150022.GD18620@edge>	<54088734.1090204@pabigot.com>
	<54088819.60906@pabigot.com>
In-Reply-To: <54088819.60906@pabigot.com>
Subject: Re: poor performance of OpenEmbedded on, BeagleBoneBlack compared to Debian
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
X-List-Received-Date: Thu, 04 Sep 2014 17:50:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2014 10:41 AM, Peter A. Bigot wrote:
> On 09/04/2014 10:37 AM, Peter A. Bigot wrote:
>>
>> But I'm still looking for a way to set the CPU frequency to the 
>> higher values supported on Beaglebone Black.  I had hoped meta-ti's 
>> would be able to do that, since it has bone vs boneblack device trees 
>> and u-boot detection.
>>
>> Any hints where to look for clock settings?
>>
>
> Apologies; I didn't read Mikhail's full email before responding. 
> Thanks for the links; I'll check those out, and maybe provide meta-ti 
> patches so this gets fixed at the "source".

And with the clues from the referenced patch I finally found this in 
arch/arm/mach-omap2/opp33xx_data.c where it's apparently been for some 
time.  Dunno why I wasn't seeing it on meta-ti kernels; juggling too 
many variables I guess.

Peter

