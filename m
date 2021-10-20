Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.9878.1634744458744851549
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 08:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SzFiNaQT;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id bj31so3507421qkb.2
        for <meta-ti@lists.yoctoproject.org>; Wed, 20 Oct 2021 08:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:message-id:from:to:cc:subject:in-reply-to:references
         :mime-version:content-disposition:content-transfer-encoding;
        bh=2he/0nxG46O5+0OLBEAucWbthh0LMtL9RVmXETkjcqI=;
        b=SzFiNaQTw82BXYY8Wc4oaUotS4J/4Z8H9oMgxkh50EnT2Fqg/ORGFawtnO0CRPui5U
         mR0IIasV9q8Tvxd/nM22S1rOKK+hPTbd9BcXZJuIGT+TiahRnoHD8HUiT2Ow+vvSm+T9
         SyBvEeTqPR3Kzm/LRpj3UjD7/GJWkuSgeH1xDLk+wTIpOaOTDb/mqgkGyFD6g+zSCchX
         U607ILcdkQBSre7TCig6Sg7JZzyJULsByHBnF/T/C/eFMnSZ7p3JH8a/xxDOO9U12PU+
         CveE6seeijqBdgKkZzyr8UPZaRG/jz0mUWiT20cJK+WV80nUfZg+2UWmsT3XZNC+WgGu
         5HkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:from:to:cc:subject:in-reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding;
        bh=2he/0nxG46O5+0OLBEAucWbthh0LMtL9RVmXETkjcqI=;
        b=VpbI1mD3WjDcGqBe6Xxhg0R7p6YlKuYG1KjoEaCMdsAR+JHKLzUoXQEb3eNe6rBPwx
         mjnIK+H0CutAC6CIgqZezXmBgaysrGxREjhqYoVEAmHVTQFTVQzaT6f4c5mfOGW9wDSN
         rb2fnL3iZK5l15kFBFXifP7hHDJb+uGTgPJjmtCkeU9GxIjigfP7EAKddgQaaOUItAt3
         HG50vk4O7PSvMFro2V6UYLXyaU02mvakNfisqjS/0gO/XblXbe2XmEJ01JDG+oE/b/HY
         VNdn3yN/mN0NYMu9CHlqjSrG5cBe/UevDdH7Isaxl+dRhp9XMySKV8dyuQR0WNPknbvn
         ZGDQ==
X-Gm-Message-State: AOAM531mGKyRp/a3/iipbupL38xdYPGut1dUqS29PdCSXwNOTtuPeg9N
	eR0Y1RVBkfJxJSyy5a+hwck=
X-Google-Smtp-Source: ABdhPJyM4ryRrkZSGVFBSpuEFPjC4bbYX+7VJe9DeLnbVr72K6xdwIl97Fk9d9UOa2k7TTtHMAHQSQ==
X-Received: by 2002:a37:6396:: with SMTP id x144mr217396qkb.397.1634744457845;
        Wed, 20 Oct 2021 08:40:57 -0700 (PDT)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (bras-base-mtrlpq2848w-grc-41-70-53-240-121.dsl.bell.ca. [70.53.240.121])
        by smtp.gmail.com with ESMTPSA id b14sm1159806qtk.64.2021.10.20.08.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 08:40:57 -0700 (PDT)
Date: Wed, 20 Oct 2021 11:40:56 -0400
Message-ID: <20211020114056.GB826873@t480s.localdomain>
From: "Vivien Didelot" <vivien.didelot@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>,
 Praneeth Bajjuri <praneeth@ti.com>
Subject: Re: ti-sgx-ddk-km proper toolchain detection
In-Reply-To: <3bdc5f6ec0e1bb5dcab685eaaa14053f9abf6205.camel@linuxfoundation.org>
References: <20211019144905.GB3675266@t480s.localdomain>
 <3bdc5f6ec0e1bb5dcab685eaaa14053f9abf6205.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Richard,

On Wed, 20 Oct 2021 09:36:55 +0100 Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> As for cross-canadian zeroing out the ABI extension, this is because it has to
> support *all* targets so it will create one compiler and symlink into place all
> the variants the user might need.

Maybe I don't quite get it yet, but since cross-canadian handles ABIEXTENSION
and creates symlinks, can't the build (or at least some recipes) be passed an
"hf" suffixed link to satisfy recipes expecting arm-*-gnueabihf?


Thank you,

	Vivien
