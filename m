Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.10195.1582108080490973219
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Feb 2020 02:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20150623.gappssmtp.com header.s=20150623 header.b=AojNi8K3;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.128.45, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-wm1-f45.google.com with SMTP id t14so6160500wmi.5
        for <meta-ti@lists.yoctoproject.org>; Wed, 19 Feb 2020 02:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=mKy3ZtaHKYS3bUUAZA7XLj/3SAp/ynq0/cSzAckiSIY=;
        b=AojNi8K3YAVgGzN6Epm7PrKc8gUP3PIFwHb3nLQHL7evStxw+FxzvME0WQzlGDBALT
         z3zaVXtg6/z7/BvsZlOZHZdFbrwPnbJuMWi8qx3FNuCLMi/dJwIPqhFSar5BZ8InDK+q
         gL6eSe1Xnl2uTwtuBCJZt3E9JXSoVFdx8GDk2wO5DcU/UBh0+ZVJmA354Ep50bTgOJ29
         LSwVetC1cW0yjeRFVHb7Vdqs1Ac1u/P/QB5byVVdBfP1hKdZNdEcBXtTepxlT14JHNnc
         cOIfLw/fN7M8igQ1/8NA2wQCHbPPXVI3H4aEG+Prmp/Yqa69dHAMHUppSLidpWpCurnz
         G9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=mKy3ZtaHKYS3bUUAZA7XLj/3SAp/ynq0/cSzAckiSIY=;
        b=HiORY0IbS2xyrm3GH15FVOsjBCKQR+jURqs5qKUmfiZEJ3CXKtCkz8sDvfOdtQi30k
         PAJ4mmaiatUYuJZBk16PY+OFfZpfH5tXUyqDa95axiR+DRAQPR4fXfoO/XEaDl5DVFa9
         PaavUbZHVT1lSYUw9se4z/e+FdXQ3cyBHFt6f+fRM7Z6k8vS5Zd9co6OQPHGqWBtOkw4
         fkEo5+xSd2Jve6Bk6WpYH2yJmk7Ll+CzAx/ukCvdQrPYwvAQGXcIXNz7B/XgA3pUAwLe
         u6LwN9pS4rXLRqIZuxtumabLt6kyKytRwyBCbKuGoMzRNhMAHIXxAfhggjCAtdFC8vSk
         kArQ==
X-Gm-Message-State: APjAAAXqlZeDdW5P04XR8qy3VGoHPfggdskimsdIONlC9yPrRS7OCPi2
	R8ZnxT2dTmXFmNAgLPw2XWghOqW0B24=
X-Google-Smtp-Source: APXvYqwPFCZtSgEAVJ6Sm2uBHdQ1mwJQgFMJM5IZc6AGD5cMYJt/hkRxg84Z9pk1NfdFPwNHzzoW0g==
X-Received: by 2002:a1c:b0c3:: with SMTP id z186mr8959238wme.36.1582108078452;
        Wed, 19 Feb 2020 02:27:58 -0800 (PST)
Return-Path: <daniel.ammann@bytesatwork.ch>
Received: from [192.168.2.42] (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id b17sm2391857wrp.49.2020.02.19.02.27.57
        for <meta-ti@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2020 02:27:58 -0800 (PST)
To: meta-ti@lists.yoctoproject.org
From: "Daniel Ammann" <daniel.ammann@bytesatwork.ch>
Subject: am437x-evm zeus image
Message-ID: <8c9b4eef-4998-8859-fa66-e26f7f649223@bytesatwork.ch>
Date: Wed, 19 Feb 2020 11:27:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all

I'm trying to build a zeus image for am437x-evm. How do I go about that? Is
meta-ti branch zeus ready yet?

First, I tried a simple poky build with meta-openembedded and meta-ti, building
core-image-base. But compiling of ti-sgx-ddk-km fails.

Then I followed the instructions in the arago wiki [1], but the build fails
with qtbase because qtbase doesn't run configure successfully.

What is the recommended way to compile a development image? The goal is to compile
a qt5 application with qtwebengine that needs eglfs support.

[1] http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment

Thanks and kind regards

Daniel


-- 
bytes at work
Technoparkstrasse 7
CH-8406 Winterthur
Switzerland

phone: +41 52 550 50 67
