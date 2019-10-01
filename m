Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C734EE00D33; Tue,  1 Oct 2019 15:42:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.210.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1238CE00CB9
	for <meta-ti@yoctoproject.org>; Tue,  1 Oct 2019 15:42:55 -0700 (PDT)
Received: by mail-pf1-f196.google.com with SMTP id x127so9153080pfb.7
	for <meta-ti@yoctoproject.org>; Tue, 01 Oct 2019 15:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pivxT6mqUnJO3wPEsfvINUA7rL/zkssxge1OkALI2Nw=;
	b=VdaXueKYiVxX/hsUycaYIc+kpMYgZ2QEY7iAZY9TKqLvh4CdZsUvIkSzG5wGW6ov11
	FWN4cbahCzmIVLlAPAZe+pm4OuMUEi8CX6wbvxXKNC1q3fMFLineE5pHg4SjdurK5uzC
	1VwUX9l6GNgFMBBVVJc2sHncpLdFWQDgr8UEr8YJtx0gjM9bBBbbS1QjI1RPElLCbtuJ
	RYeTErGYcO619jTMjl2djU9gFDiDjqjsmfhQ3Ojd6XllYhDkmVngHlB5dKk9mWaTnoE7
	4F7zLjbBJHuzqNg2BkjYPtukH2VTRiCUkdo/HdvQSuS7uskCi6RaGrF+Gvj+FBA9Mey6
	ocwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=pivxT6mqUnJO3wPEsfvINUA7rL/zkssxge1OkALI2Nw=;
	b=mPzlSyqcFXlg+jjVRX4T68sDoCM2RWfSrzOQiveBAOLCauOQ1bqMuhyUaocZfREoaU
	7ddsSigm6XE1o0/gwu4qlqCiIVOJxrBxAXUdthBTXUhGoWsnjeBrDUccBUcuaugvkova
	Lp97d1Q7vKl7o360XBHnU7eaG9SYJDrPWZjl0t7X1FcjNSTCSNn1Nw54MX6+aS6+VgF8
	Ftlb+7u24cJZbeyVlp7g3Ysdqf9bUlnIjl+mY6JdlUE3JHuHUXK0rQN92EbtdM3++Gaq
	M0yrX04yflqJhPKza3L+FErGPXl5iNC6ohbhaPw4QkWIw1uHfuILJHYaNoEJV3bHOxvT
	yeBg==
X-Gm-Message-State: APjAAAV5BpZ8pyi3CXCsqmvF2osi+nzSV0e0XXx+fvs2DjtrQeP3GyGL
	TFP72wa2kYqPMKNVThzchYuMZMefWSo=
X-Google-Smtp-Source: APXvYqwB6EwBmDp/6IJ4ydRN8cMm4y8OXgtYhk6zFWUP8LZMJaPLG0Rq+Rg3OTGcbP20wJjgGCYMwA==
X-Received: by 2002:a63:f401:: with SMTP id g1mr264008pgi.314.1569969774731;
	Tue, 01 Oct 2019 15:42:54 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:1c20:a10a:ac85:47a8:dcda?
	([2601:646:8500:1c20:a10a:ac85:47a8:dcda])
	by smtp.gmail.com with ESMTPSA id
	193sm16822534pfc.59.2019.10.01.15.42.53
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 01 Oct 2019 15:42:54 -0700 (PDT)
To: Denys Dmytriyenko <denys@ti.com>
References: <1569575804-36910-1-git-send-email-nikhil.nd@ti.com>
	<CAMKF1soPvCo8VKJu10P1fvjA_iJjeskJ59wyyNBTCt8LxvRxTQ@mail.gmail.com>
	<20191001200747.GD18229@beryl>
	<CAMKF1sqxULQgUz0dy_utWs5_s96Fp4+d9hYbcS+W9J-MHk6z7A@mail.gmail.com>
	<20191001221602.GF18229@beryl>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <84aa534f-1f7b-1f1b-b7c6-c7ea284d9b27@gmail.com>
Date: Tue, 1 Oct 2019 15:42:53 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
	Gecko/20100101 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191001221602.GF18229@beryl>
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master PATCH v2] recipes-bsp: ivshmem-uio: Add new recipe for ivshmem-uio driver
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
X-List-Received-Date: Tue, 01 Oct 2019 22:42:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/1/19 3:16 PM, Denys Dmytriyenko wrote:
> On Tue, Oct 01, 2019 at 02:57:41PM -0700, Khem Raj wrote:
>> On Tue, Oct 1, 2019 at 1:07 PM Denys Dmytriyenko <denys@ti.com> wrote:
>>
>>> On Mon, Sep 30, 2019 at 11:41:43PM -0700, Khem Raj wrote:
>>>> On Fri, Sep 27, 2019 at 2:17 AM Nikhil Devshatwar <nikhil.nd@ti.com>
>>> wrote:
>>>>>
>>>>> This is external kernel module which enables userspace io over the
>>>>> Jailhouse ivhsmem (inter VM shared memory)
>>>>> This driver is useful to test the inter VM communication.
>>>>>
>>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>> ---
>>>>> Changes from v1:
>>>>> * Split the ivshmem recipe separately
>>>>> * Add summary and remove PACKAGE_ARCH define
>>>>>
>>>>>   recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb | 27
>>> +++++++++++++++++++++++
>>>>>   1 file changed, 27 insertions(+)
>>>>>   create mode 100644 recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
>>>>>
>>>>> diff --git a/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
>>> b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
>>>>> new file mode 100644
>>>>> index 0000000..33fb946
>>>>> --- /dev/null
>>>>> +++ b/recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
>>>>> @@ -0,0 +1,27 @@
>>>>> +DESCRIPTION =  "Kernel driver for IVSHMEM based UIO driver"
>>>>> +SUMMARY = "Kernel module which registers a UIO (userspace io) device
>>> for inter VM shared memory"
>>>>> +HOMEPAGE = "https://github.com/henning-schild-work/ivshmem-guest-code
>>> "
>>>>> +LICENSE = "GPLv2"
>>>>> +LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=0546a27aad86c83b75ad4ee6133e9d5e"
>>>>> +
>>>>> +inherit module
>>>>> +
>>>>> +RDEPENDS_${PN} = "jailhouse"
>>>>> +
>>>>
>>>> jailhouse is marked as ti-soc specific, so please mark this recipe
>>>> ti-soc specific as well. It will help meta-ti to live in a multi-BSP
>>>> distros
>>>>
>>>>
>>> http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86-64/1164/consoleFull
>>>>
>>>> if you could test meta-ti patches with one non-ti machine like qemux86
>>>> or some such it will help catch this kind of errors
>>>
>>> That would only fail when building "world", but thanks for the report.
>>
>> MACHINE=qemux86 bitbake <recipe> would do it
>> This would really help the distros
> 
> Well, I do know how to break it specifically... :) BTW, building it directly
> like that with COMPATIBLE_MACHINE set would also fail with "Nothing PROVIDES"
> error.
> 
> My point was that people add recipes and expect them to only be included in an
> image for their machine. In their view they cannot understand how it would get
> into an x86 build on its own, unless someone consciously adds it to their
> image. Hence my comment about building "world". And in that case it would be
> safely skipped by COMPATIBLE_MACHINE and won't result in an error.
> 
I think this is fine from submitter point of view, Probably, on the 
reviewer side, this should be considered as a test to accept a 
contribution. I am happy to test your master-next or any other staging 
branch that you use for testing meta-ti contribution, provided you will 
hold commits and wait for build results from Yoe Distro world builds.


