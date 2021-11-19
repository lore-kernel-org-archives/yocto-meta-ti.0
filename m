Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.11478.1637339689803081628
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 08:34:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=n/UfvmLM;
 spf=pass (domain: konsulko.com, ip: 209.85.160.180, mailfrom: trini@konsulko.com)
Received: by mail-qt1-f180.google.com with SMTP id f20so9993399qtb.4
        for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 08:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TVfUtwUjzYAwqDVk7MWlhEMnBQBQgfeyBduAx8WjtF8=;
        b=n/UfvmLMz5WmgZEY31fAMIjCQ4bY2l47LT+LG/MWJO1vLyJ/MgrLdKy2h9vpLPfiXu
         Rn95faNJvKLGT3gw+o+TC5v4DYS6YAyK1W3VrnJ0zHdkrgwHa05t6jXQ7I/CEzypqlRQ
         sLU31ut6eiNSoh/SbPTN+N+Em9VVhNp8ELlgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TVfUtwUjzYAwqDVk7MWlhEMnBQBQgfeyBduAx8WjtF8=;
        b=b66TUEMQnXGd9GR4ShJuConfwW/1JX0S6CJeSDTklnwVD9GFd+GBTAYsPnArrqCzlz
         zsAE6Q34dW66s6ThC7cjf1N4RM8hFf71VGyFfUiv32SXLFKE9OYZRV5trUrA0gPSLPv/
         /9phPD3efNgvilo1GTL8QJZnEvyYKEHgMBHqrKtYEnu3nwk0EvKX6vJDS5TGIjelwJq2
         IMyrm2IdZUzcTVtx/BuZqqqNfEMF/4ot7LVWjv9sUZGF67o4f1DvAcbVT1XDcJqOQyzX
         pOjyBn9l/7wHML5Fos9R1rnLR3YWH6RSAKWrGdzxj0gFCKs5VBZjH7gBy72lPya5okvS
         t1Vw==
X-Gm-Message-State: AOAM533QDH7kFyZ6IATgaKhAJ1Q6lKqN5TolA/3uJjM0KYAJjCOXQDE5
	MbuS/7Unxf4UiFfZVkiFOgGmaA==
X-Google-Smtp-Source: ABdhPJx1reOjSIAiUAX9WAqOUw3D9KIACWjuQyWzbQn+7zdcGI4jiyeTsnqCspI294b529rZC/r8Mw==
X-Received: by 2002:ac8:5acf:: with SMTP id d15mr7727919qtd.5.1637339688977;
        Fri, 19 Nov 2021 08:34:48 -0800 (PST)
Return-Path: <trini@konsulko.com>
Received: from bill-the-cat (2603-6081-7b01-cbda-298c-b356-0e05-d708.res6.spectrum.com. [2603:6081:7b01:cbda:298c:b356:e05:d708])
        by smtp.gmail.com with ESMTPSA id v1sm161514qtw.65.2021.11.19.08.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 08:34:48 -0800 (PST)
Date: Fri, 19 Nov 2021 11:34:46 -0500
From: "Tom Rini" <trini@konsulko.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: yogeshs@ti.com, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH] wic: revert grub-efi patch
Message-ID: <20211119163446.GH24579@bill-the-cat>
References: <20211119022952.6588-1-yogeshs@ti.com>
 <20211119024657.GK18191@denix.org>
MIME-Version: 1.0
In-Reply-To: <20211119024657.GK18191@denix.org>
X-Clacks-Overhead: GNU Terry Pratchett
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 18, 2021 at 09:46:57PM -0500, Denys Dmytriyenko wrote:
> +Tom
> 
> On Fri, Nov 19, 2021 at 02:29:52AM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
> > Revert "conf/machine: k3: Enable grub-efi by default in wic images"
> > 
> > This reverts commit d0b09833b44fa23cce86fd99dd8ca6631c61c476.
> 
> It is customary to provide a reason for revert.

Especially since EFI booting is the path forward.  I know there was some
messages about this breaking non-EFI booting but there wasn't enough
context to explain what was really going on.

-- 
Tom
