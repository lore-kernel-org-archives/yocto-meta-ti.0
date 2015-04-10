Return-Path: <gary@mlbassoc.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C1C0FE009A1; Fri, 10 Apr 2015 15:08:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6620BE00961
	for <meta-ti@yoctoproject.org>; Fri, 10 Apr 2015 15:08:10 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 36FC9F811D7; Fri, 10 Apr 2015 16:08:10 -0600 (MDT)
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id ADBBAF811D7;
	Fri, 10 Apr 2015 16:08:09 -0600 (MDT)
Message-ID: <552849DC.1000406@mlbassoc.com>
Date: Fri, 10 Apr 2015 16:08:28 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <1428702884-23501-1-git-send-email-sam.nelson@ti.com>
	<20150410220458.GC9147@edge>
In-Reply-To: <20150410220458.GC9147@edge>
Subject: Re: [PATCH] mmap-lld: Update to new version 2.0.0.4
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
X-List-Received-Date: Fri, 10 Apr 2015 22:08:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-04-10 16:04, Denys Dmytriyenko wrote:
> On Fri, Apr 10, 2015 at 05:54:44PM -0400, Sam Nelson wrote:
>> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>> ---
>>   recipes-bsp/mmap-lld/mmap-lld.inc |    8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
>> index b8a5b32..7c19ee8 100644
>> --- a/recipes-bsp/mmap-lld/mmap-lld.inc
>> +++ b/recipes-bsp/mmap-lld/mmap-lld.inc
>> @@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b3315b8190036fe1c6a8263d02e15606"
>>
>>   BRANCH="master"
>>   SRC_URI = "git://git.ti.com/keystone-rtos/mmap-lld.git;destsuffix=git/ti/runtime/mmap;protocol=git;branch=${BRANCH}"
>> -# Commit correspond to DEV.MMAP.02.00.00.03
>> -SRCREV = "601f9284c392f67bb7f69ed1a5df5231a43c3137"
>> +# Commit correspond to DEV.MMAP.02.00.00.04
>> +SRCREV = "306895eb2d5decd14a760e70d273946958ff716f"
>>
>> -PV="2.0.0"
>> -PR = "r0"
>> +PV = "2.0.0.4"
>> +PR = "r1"
>>
>>   S = "${WORKDIR}/git/ti/runtime/mmap"
>> \ No newline at end of file
>
> ^^^ This is usually not a good sign.

Also current practice is to not change PR values, but let
the PR Service handle that.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

