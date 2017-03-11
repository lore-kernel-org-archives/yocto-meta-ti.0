Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 36C71E00A08; Fri, 10 Mar 2017 18:45:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.192.193 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.192.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23A72E009B9
	for <meta-ti@yoctoproject.org>; Fri, 10 Mar 2017 18:45:02 -0800 (PST)
Received: by mail-pf0-f193.google.com with SMTP id v190so12622306pfb.0
	for <meta-ti@yoctoproject.org>; Fri, 10 Mar 2017 18:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9hyojtK52HID4SiCiMuiA8EIht4lmFj1xgCIahpNqko=;
	b=qSEuKdEsYrqDeQpL57GjBsQUFbYKLnI625G7kXr6z8JPDBz6qERvvnXrwtXRgPXexi
	UdTyLnH16vYZ4BY+gMwuWLiCAf8c94DUuGgbxXSnHwwyWz+tWwYiHx548SIDPPQFsILX
	Dvxd79cSmOd2RUMqh85CHAVX0qMIj2VO1/oaswtL/yoxpdv08du8sRGUhPIV1wTKhWtQ
	dIuAcebijlFt2IifZgdKdyFWr8ite+DakixYKKmrwlFFv+aobJ8udupT6IAisncRqdEy
	V4byGvu0mn42KUN/BfZZxQVSQ/7KQTP2wLqwA91n5xIEu7i7iNX1+4ED3HdObKaxoZHv
	guYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9hyojtK52HID4SiCiMuiA8EIht4lmFj1xgCIahpNqko=;
	b=sc+lAi12CN9kpuTi35/OtL6IO+WUPwbRkYpckGiVsBNOPcankvxVu7plJY0piUDuXE
	OFG7PUur/XPHoGw32k7wiDr3ZAkuc9PqIaFqQb21EjSgMK+ijQqav6N0A0g3htWk+UAI
	UDg7+DWdjteh2smMBp1M2rMCn3y9JzyarDSk7/1tSFQNYidkgo0+CgbMS6VfjER7eLwu
	X735e979w5PDnz5nCRwQfx6lYyOYreTanPvacX2OcCC4z8AykIKnOfMvv3TB2bxZJMwP
	y0V/WgeEBtriOerIAVMm1p9cjDi3cdhCJ3hGbDrJ/im3jjL/3L2hcekEBYw/JCKW1Eke
	yQzA==
X-Gm-Message-State: AMke39n/BmD3fQ8jcCvoQpaK0n4pk+fRukvKw2xkSwnQ+s0bqbxSJ09/EHhWyMzU22yrHg==
X-Received: by 10.84.238.9 with SMTP id u9mr30553921plk.174.1489200301917;
	Fri, 10 Mar 2017 18:45:01 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:d16a:f79a:feb6:e660])
	by smtp.gmail.com with ESMTPSA id
	c22sm21091594pgn.43.2017.03.10.18.45.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Mar 2017 18:45:01 -0800 (PST)
To: Denys Dmytriyenko <denys@ti.com>
References: <c8ccbb2d-d31b-7f5c-e002-afe69980dd86@mlbassoc.com>
	<20170308170328.GA2586@haswell> <20170311014705.GY578@edge>
	<8777103b-9a6f-c1fb-f5ad-f04dc7f44401@gmail.com>
	<20170311022715.GA578@edge>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <9aaf9e56-7ad8-ede6-600d-eac5879a2c7f@gmail.com>
Date: Fri, 10 Mar 2017 18:45:00 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <20170311022715.GA578@edge>
Cc: meta-ti@yoctoproject.org, Gary Thomas <gary@mlbassoc.com>
Subject: Re: Getting TI tools into [host] SDK
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
X-List-Received-Date: Sat, 11 Mar 2017 02:45:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/10/17 6:27 PM, Denys Dmytriyenko wrote:
> On Fri, Mar 10, 2017 at 06:00:20PM -0800, Khem Raj wrote:
>>
>>
>> On 3/10/17 5:47 PM, Denys Dmytriyenko wrote:
>>> On Wed, Mar 08, 2017 at 09:03:28AM -0800, Khem Raj wrote:
>>>> On 17-03-08 09:10:18, Gary Thomas wrote:
>>>>> I'm trying to build a [host] SDK for my target which uses some
>>>>> TI tools, via -c populate_sdk_ext
>>>
>>> Gary,
>>>
>>> We don't use -c populate_sdk to produce SDKs. Instead, we still rely on the 
>>> old meta-toolchain mechanism. First, because it can be incorporated into other 
>>> recipes - i.e. we have a recipe that combines rootfs and SDK into one tarball. 
>>> Second, it provides more control to what get's packaged into SDK. Third, it 
>>> doesn't have this undefined magic to packaging stuff - i.e. this post is an 
>>> example of it failing. And only one slight drawback - requires keeping rootfs 
>>> image recipe in sync with meta-toolchain SDK recipe...
>>>
>>>
>>>>> In particular, I'm using recipes-ti/devtools/ti-cgt-pru_2.1.4.bb
>>>>> I include ti-cgt-pru-native to use the tools in my bitbake recipes - that works fine.
>>>>> I include ti-cgt-pru in my target image to get the tools on my board - that also works.
>>>>>
>>>>> The problem is that in my SDK, none of the binaries are included, including clpru:
>>>>>
>>>>> $ ls -l /home/gthomas/my_ti_sdk/tmp/sysroots/rainier-p8701/usr/share/ti/cgt-pru
>>>>> total 16
>>>>> drwxrwxr-x 2 gthomas gthomas 12288 Mar  8 08:22 include
>>>>> drwxrwxr-x 3 gthomas gthomas  4096 Mar  8 08:22 lib
>>>>>
>>>>> I added this to try and include the files:
>>>>>   TOOLCHAIN_HOST_TASK += "'nativesdk-ti-cgt-pru"
>>>>> and I can see that there was a nativesdk-ti-cgt-pru built which does have all the
>>>>> executables included, they just aren't being packaged.
>>>>>
>>>>> $ ls tmp/work/x86_64-nativesdk-mysdk-linux/nativesdk-ti-cgt-pru/2.1.4-r0/image/opt/mydistro/2.2+snapshot/sysroots/x86_64-amltdsdk-linux/usr/share/ti/cgt-pru/bin
>>>>
>>>> perhaps you need to correct the install location for nativesdk may be
>>>> via overriding do_install
>>>
>>> Why?
>>
>> because  /usr/share doesnt look normal place for putting executables.
> 
> True in general, but that shouldn't matter. FILES_${PN} lists those and that 
> should be enough. It appears you are just guessing...
> 
> Sidenote:
> This PRU CodeGen toolchain is kind of weird - it targets PRUs (Programmable 
> Real-time Units http://elinux.org/Ti_AM33XX_PRUSSv2) and provides binaries in 
> bin/, headers in include/ and libraries in lib/ directories. Some of the names 
> collide with system (e.g. libc.a) and hence cannot be installed in standard 
> locations, thus /usr/share. In fact, many of non-Linux specific components 
> that deal with specialized cores (i.e. non-general-purpose ARM, such as DSP, 
> PRU, IPU, numerous Cortex-M accelerators, etc.) are in fact as weird and are 
> also getting installed in /usr/share to not confuse people and not conflict 
> with the rest of the system...
> 

it would be better to have multiple sysroots for all these variants
would be way simpler and understandable, but why do I care.


