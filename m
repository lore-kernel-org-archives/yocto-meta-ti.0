Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C75C433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 18:29:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.919.1651516151135165220
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 11:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PmuENFpG;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 242IT6LY118635;
	Mon, 2 May 2022 13:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651516146;
	bh=mEii4ARZnatDWd/aqNZhYg5JWUSo9HGNCjApHQj3ues=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PmuENFpG1FmgCgDoonm6MA9VEt4MGAIhvIdcr6kvSLbOY3Jt1ohbM4VLttzdkRo7z
	 ORLxF/AHy6sEcktZuy8VJVTZP3kgdrZ1tB0yol3qo95MPvDpaburHWld9aqW6/WbTo
	 EDGxvXUljc4NWEVix87SoGI/SWYyfNt6llJhZvGM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 242IT60Q125898
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 May 2022 13:29:06 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 2
 May 2022 13:29:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 2 May 2022 13:29:06 -0500
Received: from [10.249.39.108] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 242IT6D6003522;
	Mon, 2 May 2022 13:29:06 -0500
Message-ID: <1aa11cce-610d-9b24-09ce-b540f4ed2bf5@ti.com>
Date: Mon, 2 May 2022 13:29:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-ti] [PATCH] uio-module-drv-test: Fix build with clang
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Khem Raj <raj.khem@gmail.com>, <meta-ti@lists.yoctoproject.org>
References: <20220501164920.2828087-1-raj.khem@gmail.com>
 <53c2b96d-676c-e4b7-6f74-33f1211e8912@ti.com>
 <20220502182404.GV9834@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220502182404.GV9834@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 18:29:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14675



On 5/2/2022 13:24, Denys Dmytriyenko wrote:
> On Mon, May 02, 2022 at 12:59:59PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>> Was this patch sent to the upstream repository maintainer?  This
>> seems like a very basic change that should work for all compilers
>> and so should be pushed upstream.
> 
> If only the upstream project was still alive:
> 
> https://git.ti.com/cgit/keystone-linux/uio-module-drv/
> 
> This code is used for PRU using UIO on AM3/BBB, AM4, AM5 and DRA7.

Yeah, I'm realizing that now and attempting to manually make the same 
changes and commit them.  Then we can change the SRCREV to point to the 
new version.

> 
>> On 5/1/2022 11:49, Khem Raj wrote:
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>   ...-instead-of-int8_t-in-main-signature.patch | 89 +++++++++++++++++++
>>>   .../uio-module-drv/uio-module-drv-test_git.bb |  4 +
>>>   2 files changed, 93 insertions(+)
>>>   create mode 100644 meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test/0001-tests-Use-char-instead-of-int8_t-in-main-signature.patch
>>>
>>> diff --git a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test/0001-tests-Use-char-instead-of-int8_t-in-main-signature.patch b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test/0001-tests-Use-char-instead-of-int8_t-in-main-signature.patch
>>> new file mode 100644
>>> index 00000000..172ed7cb
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test/0001-tests-Use-char-instead-of-int8_t-in-main-signature.patch
>>> @@ -0,0 +1,89 @@
>>> +From 972b8514cc99e76508363d2304bb13c27df99cd6 Mon Sep 17 00:00:00 2001
>>> +From: Khem Raj <raj.khem@gmail.com>
>>> +Date: Sun, 1 May 2022 09:39:42 -0700
>>> +Subject: [PATCH] tests: Use char instead of int8_t in main signature
>>> +
>>> +int8_t is a define in C99 which is flagged by C compiler ( clang )
>>> +
>>> +Fixes errors like below
>>> +
>>> +pruss_uio_test.c:264:6: error: second parameter of 'main' (argument array) must be of type 'char **'
>>> +void main (int32_t argc, int8_t **argv)
>>> +
>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> +---
>>> + test/gen_ipc_int.c                       | 2 +-
>>> + test/prussdrv_test/test/pruss_uio_test.c | 2 +-
>>> + test/uio_cic2_int_multithread_test.c     | 2 +-
>>> + test/uio_int_test.c                      | 2 +-
>>> + test/uio_mem_test.c                      | 2 +-
>>> + 5 files changed, 5 insertions(+), 5 deletions(-)
>>> +
>>> +diff --git a/test/gen_ipc_int.c b/test/gen_ipc_int.c
>>> +index 2be3a9d..313c76a 100644
>>> +--- a/test/gen_ipc_int.c
>>> ++++ b/test/gen_ipc_int.c
>>> +@@ -26,7 +26,7 @@ static int64_t clock_diff (struct timespec *start, struct timespec *end)
>>> +              + end->tv_nsec - start->tv_nsec;
>>> + }
>>> +
>>> +-void main(int32_t argc, int8_t **argv)
>>> ++void main(int32_t argc, char **argv)
>>> + {
>>> + 	int size;
>>> + 	char *map ;
>>> +diff --git a/test/prussdrv_test/test/pruss_uio_test.c b/test/prussdrv_test/test/pruss_uio_test.c
>>> +index 5af4a2c..7391fbd 100644
>>> +--- a/test/prussdrv_test/test/pruss_uio_test.c
>>> ++++ b/test/prussdrv_test/test/pruss_uio_test.c
>>> +@@ -261,7 +261,7 @@ int bsp_init()
>>> +
>>> + }
>>> +
>>> +-void main (int32_t argc, int8_t **argv)
>>> ++void main (int32_t argc, char **argv)
>>> + {
>>> +     int ret_val;
>>> +
>>> +diff --git a/test/uio_cic2_int_multithread_test.c b/test/uio_cic2_int_multithread_test.c
>>> +index 0d9f126..15db958 100755
>>> +--- a/test/uio_cic2_int_multithread_test.c
>>> ++++ b/test/uio_cic2_int_multithread_test.c
>>> +@@ -287,7 +287,7 @@ void *wait_inthread_for_interrupt(void *arg)
>>> + 	}
>>> + }
>>> +
>>> +-void main(int32_t argc, int8_t **argv)
>>> ++void main(int32_t argc, char **argv)
>>> + {
>>> + 	thread_arg_t thread_arg[MAX_NUM_THREADS];
>>> + 	int ret, err;
>>> +diff --git a/test/uio_int_test.c b/test/uio_int_test.c
>>> +index 7095a0a..e0ba5a9 100644
>>> +--- a/test/uio_int_test.c
>>> ++++ b/test/uio_int_test.c
>>> +@@ -161,7 +161,7 @@ static int64_t clock_diff (struct timespec *start, struct timespec *end)
>>> +              + end->tv_nsec - start->tv_nsec;
>>> + }
>>> +
>>> +-void main(int32_t argc, int8_t **argv)
>>> ++void main(int32_t argc, char **argv)
>>> + {
>>> + 	int  fd_uio;
>>> + 	int ret;
>>> +diff --git a/test/uio_mem_test.c b/test/uio_mem_test.c
>>> +index aad13ac..3cdba37 100644
>>> +--- a/test/uio_mem_test.c
>>> ++++ b/test/uio_mem_test.c
>>> +@@ -121,7 +121,7 @@ err_exit1:
>>> + 	return ret;
>>> + }
>>> +
>>> +-void main(int32_t argc, int8_t **argv)
>>> ++void main(int32_t argc, char **argv)
>>> + {
>>> + 	int  fd_map;
>>> + 	int ret;
>>> +--
>>> +2.36.0
>>> +
>>> diff --git a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
>>> index dc17a1e9..41270042 100644
>>> --- a/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
>>> +++ b/meta-ti-bsp/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
>>> @@ -2,6 +2,8 @@ DESCRIPTION = "Test code for user space IO (UIO) driver"
>>>   include uio-module-drv.inc
>>> +SRC_URI += "file://0001-tests-Use-char-instead-of-int8_t-in-main-signature.patch"
>>> +
>>>   PR = "r1"
>>>   COMPATIBLE_MACHINE = "omap-a15|ti33x|ti43x"
>>> @@ -33,3 +35,5 @@ do_install:append:ti33x () {
>>>   do_install:append:ti43x () {
>>>           install -c -m 755 ${S}/test/prussdrv_test/test/pruss_uio_test ${D}${bindir}/.
>>>   }
>>> +
>>> +CLEANBROKEN = "1"
>>>
>>>
>>>
>>>
>>>
>>
>> -- 
>> Ryan Eatmon                reatmon@ti.com
>> -----------------------------------------
>> Texas Instruments, Inc.  -  LCPD  -  MGTS
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

