Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 00339E00B1B; Thu, 26 Sep 2019 11:28:32 -0700 (PDT)
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
	*      [209.85.215.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 053BDE0084E
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 11:28:31 -0700 (PDT)
Received: by mail-pg1-f195.google.com with SMTP id t14so2017298pgs.3
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 11:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VynX/25247KZ9ijRpOijtGOtNW8CNdO259J2xVZ/GfE=;
	b=OjZlz6aUrh+y4uJxumwcONW3k86kEgv/uhZDhqcCUQUIu5gW8nPFnt5w3OqjHUBxIl
	PuNCUtCiELZXylGdG4KzxpUP6aHXWBrrKECbtw+Rl44UZFKJLcd6uch5YyXV7y19k4zG
	vat1P306bYFG5NWSNa4gKsJN0rIt85Nvf87vgKeZlSfJvaKgM0Zd1T6puXEejkgi2+9g
	3CaUmGD0yxSRKXhYysgtEL8LETG2ei2mDuEXPD/j2ct/LvQPCebYU/KzZjQotWBqtNJf
	9GIL9O8qLtvLBjkW/zOAg6K3yRLqsibfR5Q+9+GpObDZD6a2LD4365/rcZQpt7Rus5CR
	WBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=VynX/25247KZ9ijRpOijtGOtNW8CNdO259J2xVZ/GfE=;
	b=eXLq8KG9sFiVsnWeMtbmsyoY2FePyJv3AAIByOD1MqP5+PXKxLc8+h5J7YkFUcrBM2
	oIDoeYj4YeCI6h2X7jLgQ1QuWLYCrFeU+g3eO+jZ8qApeBnbQ1gnIvwck/8G/iVN3226
	Z5cZetnH6u+nTS45lVr92TS7j5qWep7PfvW26k80X6gDlI8IxvJ2DmZt3/Z0N7kyvBri
	2Kq/T5rkm++8XFmvU+oLKtI/uVEYvSo8KoFdt3qnyTvQ8b4l+PcmEljQA2dVzZ71zBuT
	Vq8lkWaGf246N0azYDOpsPo0LJZptzxRK2LfCPEqejqhlM40FemSUUq2rr2/J+gWlIad
	iL0Q==
X-Gm-Message-State: APjAAAVG2PJrlY0Xc5kNV5S6JM+I9BNzP0Zl9SoYt3gjEXon/4Hmc/G4
	VE0rJWFGwJI+0qYr3jEvI7XWjvK/EMY=
X-Google-Smtp-Source: APXvYqy2KVjYcSWZ3kpPtX25qK+QUfhuZAHnBFrHOKiNEMCKSSGPM9zz5vYh0+WenQj4qfVxtT/hRA==
X-Received: by 2002:a63:f342:: with SMTP id t2mr4719419pgj.194.1569522510909; 
	Thu, 26 Sep 2019 11:28:30 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:1c20:1987:2136:d2a9:51b6?
	([2601:646:8500:1c20:1987:2136:d2a9:51b6])
	by smtp.gmail.com with ESMTPSA id
	t14sm2774244pgb.33.2019.09.26.11.28.30
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 26 Sep 2019 11:28:30 -0700 (PDT)
To: Denys Dmytriyenko <denys@ti.com>
References: <20190926160150.2507778-1-raj.khem@gmail.com>
	<20190926182525.GD5566@beryl>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <f4ece6e4-322f-554b-bbbe-a81e6e3cf9ad@gmail.com>
Date: Thu, 26 Sep 2019 11:28:29 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
	Gecko/20100101 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190926182525.GD5566@beryl>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] rwmem: Update to 2.0-rc2+
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
X-List-Received-Date: Thu, 26 Sep 2019 18:28:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 9/26/19 11:25 AM, Denys Dmytriyenko wrote:
> Does this need:
> 
> DEPENDS += "python3"
> 
> Otherwise do_configure fails:
> 
> -- Checking for module 'python3'
> --   No package 'python3' found
> 

it was looking for that on build system so inherit python3native should 
have fixed it. Sent a v2 just now

> 
> On Thu, Sep 26, 2019 at 09:01:50AM -0700, Khem Raj wrote:
>> - New versions uses CMake and extra modules
>> - Correct detection of nm/ranlib/ar for LTO
>> - Fix build with clang/libc++
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   ...Make-provided-vars-for-ar-and-ranlib.patch | 34 +++++++++++++++++++
>>   ....h-Include-cerrno-for-errno-definiti.patch | 24 +++++++++++++
>>   recipes-bsp/rwmem/rwmem_1.1.bb                | 13 -------
>>   recipes-bsp/rwmem/rwmem_1.2.bb                | 27 +++++++++++++++
>>   4 files changed, 85 insertions(+), 13 deletions(-)
>>   create mode 100644 recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
>>   create mode 100644 recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch
>>   delete mode 100644 recipes-bsp/rwmem/rwmem_1.1.bb
>>   create mode 100644 recipes-bsp/rwmem/rwmem_1.2.bb
>>
>> diff --git a/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch b/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
>> new file mode 100644
>> index 00000000..79968f32
>> --- /dev/null
>> +++ b/recipes-bsp/rwmem/rwmem/0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch
>> @@ -0,0 +1,34 @@
>> +From ee3bbdaae568118b4aad453c8fbb1ec648e8fbf2 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sat, 8 Dec 2018 22:48:23 -0800
>> +Subject: [PATCH] Use CMake provided vars for ar and ranlib
>> +
>> +hardcoding them means we may not be able to cross compile the package
>> +reliably as build host may or may not have gcc-ar and gcc-ranlib
>> +installed, using the cross tools is the correct thing to do here
>> +
>> +Upstream-Status: Submitted [https://github.com/tomba/rwmem/pull/5]
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + CMakeLists.txt | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>> +index 5e7f327..e36fca0 100644
>> +--- a/CMakeLists.txt
>> ++++ b/CMakeLists.txt
>> +@@ -50,8 +50,8 @@ if (NOT ${U_CMAKE_BUILD_TYPE} MATCHES DEBUG)
>> + 	if (HAS_LTO_FLAG)
>> + 		set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -flto")
>> + 		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -flto")
>> +-		set(CMAKE_AR gcc-ar)
>> +-		set(CMAKE_RANLIB gcc-ranlib)
>> ++		set(CMAKE_AR ${CMAKE_CXX_COMPILER_AR})
>> ++		set(CMAKE_RANLIB ${CMAKE_CXX_COMPILER_RANLIB})
>> + 	endif()
>> + endif()
>> +
>> +--
>> +2.19.2
>> +
>> diff --git a/recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch b/recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch
>> new file mode 100644
>> index 00000000..9f33fa5e
>> --- /dev/null
>> +++ b/recipes-bsp/rwmem/rwmem/0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch
>> @@ -0,0 +1,24 @@
>> +From 9f1d52590336caeab8038cdd015294df2e5d8c1f Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Fri, 1 Feb 2019 23:47:04 -0800
>> +Subject: [PATCH] librwmem/helpers.h: Include <cerrno> for errno definitions
>> +
>> +this is found with libc++
>> +
>> +Upstream-Status: Submitted [https://github.com/tomba/rwmem/pull/5]
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + librwmem/helpers.h | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/librwmem/helpers.h b/librwmem/helpers.h
>> +index ccc6c9e..686943e 100644
>> +--- a/librwmem/helpers.h
>> ++++ b/librwmem/helpers.h
>> +@@ -1,5 +1,6 @@
>> + #pragma once
>> +
>> ++#include <cerrno>
>> + #include <string>
>> + #include <vector>
>> + #include <string.h>
>> diff --git a/recipes-bsp/rwmem/rwmem_1.1.bb b/recipes-bsp/rwmem/rwmem_1.1.bb
>> deleted file mode 100644
>> index 2848e1cd..00000000
>> --- a/recipes-bsp/rwmem/rwmem_1.1.bb
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -SUMMARY = "A small tool to read/write memory"
>> -LICENSE = "GPLv2+"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> -
>> -SRCREV = "54904b8873b265d8f1faf82617c2f04814c102c6"
>> -SRC_URI = "git://github.com/tomba/rwmem.git"
>> -
>> -S = "${WORKDIR}/git"
>> -
>> -do_install() {
>> -	install -d ${D}${bindir}
>> -	install -m 0755 rwmem ${D}${bindir}
>> -}
>> diff --git a/recipes-bsp/rwmem/rwmem_1.2.bb b/recipes-bsp/rwmem/rwmem_1.2.bb
>> new file mode 100644
>> index 00000000..c4d2bc49
>> --- /dev/null
>> +++ b/recipes-bsp/rwmem/rwmem_1.2.bb
>> @@ -0,0 +1,27 @@
>> +SUMMARY = "A small tool to read/write memory"
>> +LICENSE = "GPLv2+"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>> +
>> +PV .= "+git${SRCPV}"
>> +
>> +SRCREV_rwmem = "7e5ca9802c1b8ff1f6407c19dfd0b9415501bb11"
>> +SRCREV_inih = "4b10c654051a86556dfdb634c891b6c3224c4109"
>> +SRCREV_pybind11 = "9a19306fbf30642ca331d0ec88e7da54a96860f9"
>> +
>> +SRCREV_FORMAT = "rwmem_inih_pybind11"
>> +
>> +SRC_URI = "git://github.com/tomba/rwmem.git;protocol=https;name=rwmem \
>> +           git://github.com/benhoyt/inih.git;protocol=https;name=inih;nobranch=1;destsuffix=git/ext/inih \
>> +           git://github.com/pybind/pybind11.git;protocol=https;name=pybind11;nobranch=1;destsuffix=git/ext/pybind11 \
>> +           file://0001-Use-CMake-provided-vars-for-ar-and-ranlib.patch \
>> +           file://0001-librwmem-helpers.h-Include-cerrno-for-errno-definiti.patch \
>> +           "
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit cmake pkgconfig python3native
>> +
>> +do_install() {
>> +	install -D -m 0755 ${B}/bin/rwmem ${D}${bindir}/rwmem
>> +	install -D -m 0644 ${B}/lib/librwmem.a ${D}${libdir}/librwmem.a
>> +}
>> -- 
>> 2.23.0
>>
>> -- 
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti


