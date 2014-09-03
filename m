Return-Path: <pierluigi.passaro@phoenixsoftware.it>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3D757E004F5; Wed,  3 Sep 2014 15:57:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [62.149.158.237 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from smtpdg10.aruba.it (smtpdg7.aruba.it [62.149.158.237])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A25EE0049D
	for <meta-ti@yoctoproject.org>; Wed,  3 Sep 2014 15:57:37 -0700 (PDT)
Received: from [192.168.1.71] ([94.33.39.20])
	by smtpcmd04.ad.aruba.it with bizsmtp
	id mmxa1o00Q0S5K6601mxaQQ; Thu, 04 Sep 2014 00:57:35 +0200
Message-ID: <54079CDE.2050706@phoenixsoftware.it>
Date: Thu, 04 Sep 2014 00:57:34 +0200
From: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <54064ACC.9020702@phoenixsoftware.it> <20140903015326.GP18620@edge>
	<5406DE8A.90801@phoenixsoftware.it> <20140903193505.GZ18620@edge>
In-Reply-To: <20140903193505.GZ18620@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: AM335X EVMSK kernel problem
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
X-List-Received-Date: Wed, 03 Sep 2014 22:57:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2014 21:35, Denys Dmytriyenko wrote:
> On Wed, Sep 03, 2014 at 11:25:30AM +0200, Pierluigi Passaro wrote:
>> Hi Denys,
>> how can I identify "latest known good commit from meta-ti for
>> linux-ti-staging"?
>>
>> Thanks
>> Pierluigi
>>
>> On 03/09/2014 03:53, Denys Dmytriyenko wrote:
>>> Pierluigi,
>>>
>>> Try the latest known good commit from meta-ti for linux-ti-staging, as
>>> meta-arago AUTOREV's the commit and there were some known regressions in the
>>> past few days, that are being looked at now.
> You can always look at SRCREV value in meta-ti/recipes-kernel/linux/linux-ti-staging_3.14.bb
> Having said that, I just pushed the latest update that supposed to contain the
> necessary fix. Please let me know if you are still having issues. Thanks.
>
Thanks for the clarification.
The kernel now boot correctly on AM335x Starter Kit.

Regards
Pierluigi

