Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 83C56E00947; Wed, 19 Aug 2015 10:17:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2279BE00767
	for <meta-ti@yoctoproject.org>; Wed, 19 Aug 2015 10:17:53 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7JHHnGY020620;
	Wed, 19 Aug 2015 12:17:50 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7JHHlZY026691;
	Wed, 19 Aug 2015 22:47:48 +0530
Received: from [172.22.218.145] (172.22.218.145) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 19 Aug 2015 22:47:46 +0530
Message-ID: <55D4BA39.104@ti.com>
Date: Wed, 19 Aug 2015 22:47:45 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1439934666-14772-1-git-send-email-denis@denix.org>
	<55D4B8D3.20703@ti.com> <20150819171559.GI6542@edge>
In-Reply-To: <20150819171559.GI6542@edge>
X-Originating-IP: [172.22.218.145]
Cc: meta-ti@yoctoproject.org, "Molfetta, Stephen" <sjmolfetta@ti.com>
Subject: Re: [PATCH] tiipclad-daemon.sh: Enabling GateMP support
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
X-List-Received-Date: Wed, 19 Aug 2015 17:17:56 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 19-Aug-15 10:45 PM, Denys Dmytriyenko wrote:
> On Wed, Aug 19, 2015 at 10:41:47PM +0530, Karthik Ramanan wrote:
>> On 19-Aug-15 3:21 AM, Denys Dmytriyenko wrote:
>>> From: "Molfetta, Stephen" <sjmolfetta@ti.com>
>>>
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>> ---
>>>   recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh b/recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh
>>> index 7f0632a..9ebfa35 100644
>>> --- a/recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh
>>> +++ b/recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh
>>> @@ -1,7 +1,7 @@
>>>   #! /bin/sh
>>>
>>>   tiipclad_daemon=/usr/bin/__LAD_DAEMON__
>>> -tiipclad_params="-l lad.txt"
>>> +tiipclad_params="-g -l lad.txt"
>>>
>>>   test -x "$tiipclad_daemon" || exit 0
>>>
>>>
>> Denys,
>>
>> This patch is required on the daisy and the master.
>>
>> daisy is very urgent and it would be great if you can merge it today
>> on the daisy branch - some further updates are blocked because of
>> this.
>>
>> Sorry for the rush.
>
> Thanks, Karthik,
>
> Do you know how it will affect Keystone devices, by any chance?
>

I don't know that for sure.

