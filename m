Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.3549.1582194110019662792
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 02:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20150623.gappssmtp.com header.s=20150623 header.b=hJm8JJlC;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.221.68, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-wr1-f68.google.com with SMTP id t3so3948388wru.7
        for <meta-ti@lists.yoctoproject.org>; Thu, 20 Feb 2020 02:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2UafSJMg47qcp9vWwH5w/2iybzlVwVI/jLg2lTU1h08=;
        b=hJm8JJlCTeNnyKmF58QhQ1TCROJvKfAon/TFkQ8ABIJLhpYMiwW5/CYppFvQrRuZoF
         ueg9JSD/lg94l6PX5IIo0i98tm1j+KLkzGZcrG2xYYPTlmcY38WAqWBOoN00yVwmhjL6
         0GgF3j5xnItqlE0xZoLdNe9JDm7fTdOtqmw+3oJZradhbXUWCLTMNv4KWsQgytcuxxfk
         xzSFeqkVTTsXKSFMzejY0nxlqXXXawzev5BL4krNPOdZK+rU1n47zFbrKiIQUQEmes34
         jet45gZqfmZLuLzJEpi8eZtkCprMDD1llmZwZJAlt6Hpg5IyUBwoY2lGcv5xuGi5PdWC
         6gxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2UafSJMg47qcp9vWwH5w/2iybzlVwVI/jLg2lTU1h08=;
        b=mto3SZOqPQXaB2kq8AqjN1FZhLk9cT4KkJVWw+ApFv3OZ9cPEskYAaQEu9baZthZ4S
         dv6AzsGR56z1DtvtxU9s/mAZW0p0A4r4HdjL3zQ2mWmV3+rDf5GVMscIExfD7fePcX/5
         mLkVQL6LX+UXQiW4b439GzeN4ijaw19yJ7PyKM9nXyS9XEPpHVMZRlwmIVaDTBAbhTKk
         4zO7EZhi48ga4Z+uRJJ0PTW26wfDJjB+SfT8Xi4IGJzfXpfFovVACJySqyIyAsqkllT0
         Ez8b2fHKj+YyUcmsHYw3VRao3JEPGKoOpg9UrBTfwKOn518lBnL9vgUq1IPdVYQPICVL
         3+0A==
X-Gm-Message-State: APjAAAVdh81ew4dRFNbZ2C1bY7s82O598gfBthNgc6ry8VNf17Rr+2uw
	rXykoR8jsjtu/AQEGa5Dr7bETa+F4Es=
X-Google-Smtp-Source: APXvYqzRFEnvhLCntDi7CsBYlQ0RuZN8eZw/4FMMs9ms+Ln2VzRz6XLZ5rKKhF1DOq8dalTNUfe/bA==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr41038342wrm.131.1582194107936;
        Thu, 20 Feb 2020 02:21:47 -0800 (PST)
Return-Path: <daniel.ammann@bytesatwork.ch>
Received: from [192.168.2.42] (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id l131sm4077169wmf.31.2020.02.20.02.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2020 02:21:47 -0800 (PST)
Subject: Re: [meta-ti] am437x-evm zeus image
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@lists.yoctoproject.org
References: <8c9b4eef-4998-8859-fa66-e26f7f649223@bytesatwork.ch>
 <20200219190052.GS720@beryl>
From: "Daniel Ammann" <daniel.ammann@bytesatwork.ch>
Message-ID: <b7af4338-6409-457d-5bf4-173ebcb92b38@bytesatwork.ch>
Date: Thu, 20 Feb 2020 11:21:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219190052.GS720@beryl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Denys

Thanks for the answer.

My build configuration looks like this:

Build Configuration:
BB_VERSION           = "1.44.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "am437x-evm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.0.2"
TUNE_FEATURES        = "arm armv7a vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta
meta-poky
meta-yocto-bsp       = "zeus:5e1f52edb7a9f790fb6cb5d96502f3690267c1b1"
meta-oe
meta-networking
meta-python          = "zeus:bb65c27a772723dfe2c15b5e1b27bcc1a1ed884c"
meta-ti              = "zeus:19a73c96bd05a74711a36a61077e8a7b88b55c63"

See below for the error messgage.

Thanks and kind regards

Daniel


ERROR: ti-sgx-ddk-km-1.17.4948957-r3v do_compile: oe_runmake failed
ERROR: ti-sgx-ddk-km-1.17.4948957-r3v do_compile: Execution of '/home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r3v/temp/run.do_compile.19460' failed with exit code 1:
grep: /home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work-shared/am437x-evm/kernel-source/include/linux/amba: Is a directory
grep: /home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work-shared/am437x-evm/kernel-source/include/linux/avf: Is a directory
grep: /home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work-shared/am437x-evm/kernel-source/include/linux/bcma: Is a directory
.
.
.
grep: /home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work-shared/am437x-evm/kernel-source/include/linux/unaligned: Is a directory
grep: /home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work-shared/am437x-evm/kernel-source/include/linux/usb: Is a directory
grep: /home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work-shared/am437x-evm/kernel-source/include/linux/wimax: Is a directory
../config/compiler.mk:96: host gcc
../config/compiler.mk:185: target arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm -fuse-ld=bfd -fmacro-prefix-map=/home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r3v=/usr/src/debug/ti-sgx-ddk-km/1.17.4948957-r3v                      -fdebug-prefix-map=/home/daniel/workspace/reference/am335x-evm-poky
/build/tmp/work/am437x_evm-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r3v=/usr/src/debug/ti-sgx-ddk-km/1.17.4948957-r3v                      -fdebug-prefix-map=/home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r3v/recipe-sysroot=                      -fdebug-prefix-map=/home/daniel/workspace/reference/am3
35x-evm-poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r3v/recipe-sysroot-native=  -fdebug-prefix-map=/home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work-shared/am437x-evm/kernel-source=/usr/src/kernel
******* Multiarch build: no
******* Primary arch:    target_armel
******* Secondary arch:  none
../config/core.mk:513: $(KERNELDIR)/vmlinux does not exist. Kbuild may fail.
eurasiacon/build/linux2/toplevel.mk:230: eurasiacon/build/linux2/moduledefs/target_armel.mk: No such file or directory
make[1]: *** No rule to make target 'eurasiacon/build/linux2/moduledefs/target_armel.mk'.  Stop.
make: *** [../config/core.mk:789: build] Error 2
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/daniel/workspace/reference/am335x-evm-poky/build/tmp/work/am437x_evm-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r3v/temp/log.do_compile.19460



On 2/19/20 8:00 PM, Denys Dmytriyenko wrote:
> Daniel,
> 
> You are not providing any useful info, such as error messages or logs.
> 
> In general, yes, am437x-evm on Zeus is ready and has been building fine in
> many different configurations.
> 
> Denys
> 
> 
> On Wed, Feb 19, 2020 at 11:27:55AM +0100, Daniel Ammann wrote:
>> Hi all
>>
>> I'm trying to build a zeus image for am437x-evm. How do I go about that? Is
>> meta-ti branch zeus ready yet?
>>
>> First, I tried a simple poky build with meta-openembedded and meta-ti, building
>> core-image-base. But compiling of ti-sgx-ddk-km fails.
>>
>> Then I followed the instructions in the arago wiki [1], but the build fails
>> with qtbase because qtbase doesn't run configure successfully.
>>
>> What is the recommended way to compile a development image? The goal is to compile
>> a qt5 application with qtwebengine that needs eglfs support.
>>
>> [1] http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
>>
>> Thanks and kind regards
>>
>> Daniel

-- 
bytes at work
Technoparkstrasse 7
CH-8406 Winterthur
Switzerland

phone: +41 52 550 50 67
