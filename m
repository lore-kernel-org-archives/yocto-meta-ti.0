Return-Path: <dv@pseudoterminal.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9A599E007AD; Mon, 18 Aug 2014 07:18:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6879AE007A2
	for <meta-ti@yoctoproject.org>; Mon, 18 Aug 2014 07:18:11 -0700 (PDT)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 0880A21389
	for <meta-ti@yoctoproject.org>; Mon, 18 Aug 2014 16:18:11 +0200 (CEST)
Message-ID: <53F20B20.7020608@pseudoterminal.org>
Date: Mon, 18 Aug 2014 16:18:08 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <53ED13BE.2090809@pseudoterminal.org>	<2948184.BeJYLBqp38@localhost.localdomain>	<53F1C2F5.50209@pseudoterminal.org>	<8239334.zKDPeKpJDo@localhost.localdomain>	<CAMCfZKFSUXqmrSP4evQyHQkRC1ygXVTROxJstDjJTDXtsAQatw@mail.gmail.com>
	<20140818141613.GI23523@edge>
In-Reply-To: <20140818141613.GI23523@edge>
Subject: Re: BeagleBone Black , u-boot, and zImage
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
X-List-Received-Date: Mon, 18 Aug 2014 14:18:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-08-18 16:16, Denys Dmytriyenko wrote:
> On Mon, Aug 18, 2014 at 09:34:58AM -0300, Diego Sueiro wrote:
>> On Mon, Aug 18, 2014 at 9:28 AM, Maciej Borzecki <
>> maciej.borzecki@open-rnd.pl> wrote:
>>
>>> Rough guess, but it looks like a default u-boot from eMMC. Try following
>>> official instruction to make it boot off SD card:
>>> https://www.yoctoproject.org/downloads/bsps/daisy16/beaglebone
>>>
>> This should do the trick:
>> "Pressing the USER/BOOT button when powering on will temporarily change the
>> boot order".
> The USER button may sometimes be tricky, as it preserves the state across
> reboots. So, if you already booted off of eMMC, holding the button and
> rebooting won't work - you'd have to unplug the power to completely turn it
> down and then power it up, while pressing the USER button. Making eMMC
> non-bootable is more reliable in many cases...
>

Oh, I didn't know about this function of that button. I will try.

