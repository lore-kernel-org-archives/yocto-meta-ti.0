Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web12.1382.1582680217832882597
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 17:23:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YbYRntZR;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id j9so529664pfa.8
        for <meta-ti@lists.yoctoproject.org>; Tue, 25 Feb 2020 17:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/wGlrvYsPxL9VNVp8/QC/BvJZfnWXvqwRQV5PrkqcMA=;
        b=YbYRntZRves3pVVtHo+nD714f+1o3KpBVdqJe/VQtXIJpGgzZCNGNBOvA8vktMPlNi
         u+4FDFGsXYIRZa8Ll6KoJ3uHGAExspj3S79NDDYH3SsEbddjcehHhkj5Nr4/nNnb2oWx
         Z/nbpEsC+4Xl3dS1/iQWMPNkYbDPJ+M51EgXgZw8ySBwIsj5edVF9b+jB0djBkR2+/Uu
         IUn390/8ZRsorB5ts2Ws7bGcb3E1iM90NKQr0RTJ7MzQr8ymQhyb5O6NRccw7ScwFNFW
         SJQA7WpyVFcVg0ZMdV0oTiFiBeHCRo3ZML+s+4TyVU1c+klAGLpAGIkCCtPM/PTfP8td
         l1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/wGlrvYsPxL9VNVp8/QC/BvJZfnWXvqwRQV5PrkqcMA=;
        b=cHm/SxKLGozQ0BNtIYnPqwLkVR3hgmyVUZUKbhNhBqlGos+pCaCyyzbsbLVOgpqw7E
         xhX7Wh6zVepU/HmH40U54CFZev9BWb2yIrL+IlLYI9fbssbnyUhPXArRFFeQ6BHgF/Qb
         53KPDs4xfMc6G27B4yDSCYesRGniKG+K1rC0EJKmxzbjZuQuTH3zNzIwYENjAyOYo/0+
         89gAJr5G5LH7r7dKnf7gCfFh2TwN3W9E0giM+yXKl9/bvUP+fPHt0tdQfNnk5u04Dz+h
         JKstanZJ53xdQhBrsnA1o6yITQL7+OiJ4xQzkFCQiZZC7BLQqsVxCDoYfTioCm4kRDBt
         DkNQ==
X-Gm-Message-State: APjAAAWyWTfr/YsGYu12xxOxM1gerPiIg+Rqv0XQcOg8gabFBFbsIqEK
	YJk+0/zbbXsd7jDkG6OTAIn23+5fTc8=
X-Google-Smtp-Source: APXvYqyOYO0i4yG9R2F2gxbeLDINC7QaRzPMbj5NJVYUevU73dgO7KrXSEEXhbr01m21vGV9K27+OA==
X-Received: by 2002:a63:3383:: with SMTP id z125mr1202534pgz.265.1582680216831;
        Tue, 25 Feb 2020 17:23:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:923a:5c32:ada4:3e27? ([2601:646:9200:4e0:923a:5c32:ada4:3e27])
        by smtp.gmail.com with ESMTPSA id s7sm312030pjk.22.2020.02.25.17.23.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2020 17:23:36 -0800 (PST)
Subject: Re: [meta-ti] [master][PATCH] ti-cgt6x: fix packaging issue due to libc.a
To: denys@ti.com, meta-ti@yoctoproject.org
Cc: meta-ti@lists.yoctoproject.org
References: <1582679379-48365-1-git-send-email-denys@ti.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <bbde41fb-0ff0-ad9f-609f-542371a62d9d@gmail.com>
Date: Tue, 25 Feb 2020 17:23:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582679379-48365-1-git-send-email-denys@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/25/20 5:09 PM, Denys Dmytriyenko via Lists.Yoctoproject.Org wrote:
> dwarfsrcfiles: .../work/armv7at2hf-neon-linux-gnueabi/ti-cgt6x/1_8.3.2-r0/package/usr/share/ti/cgt-c6x/lib/libc.a: not a valid ELF file
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-ti/devtools/ti-cgt6x_8.3.2.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> index c63c3f6..1188b4e 100644
> --- a/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> +++ b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> @@ -100,6 +100,7 @@ FILES_${PN} += "${datadir}/ti/*"
>  FILES_${PN}-dbg += "${datadir}/ti/cgt-c6x/bin/.debug"
>  
>  INSANE_SKIP_${PN} += "staticdev"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>  

Thanks for taking care of this issue, does it have any downsides, like
not stripping binaries which otherwise should have been stripped besides
libc.a

>  BBCLASSEXTEND = "native nativesdk"
>  
> 
> 
> 
> 
