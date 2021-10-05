Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web09.4672.1633476667674040631
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Oct 2021 16:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XCtSbVis;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id q125so658884qkd.12
        for <meta-ti@lists.yoctoproject.org>; Tue, 05 Oct 2021 16:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:message-id:from:to:cc:subject:in-reply-to:references
         :mime-version:content-disposition:content-transfer-encoding;
        bh=lUvBH6nr58VB+Bcg9P6b2Cq/IwqGPE/1PVz3hFVWuQ8=;
        b=XCtSbVisCGBUYFmaYsFHIr7alIVEuiMly4hYG1+AwIl27X465JQECdZEzRLhvzXzay
         +8hK3ckUlEYRVM0F/O+Oa9M20EZXy38bp21bKUTt7mvkhraGp+SGRg37S5q6OzhLfcvg
         wXPDKhmd59jkk0y1xvRVT6mlbfkY+HmhgDhHGJsLQ/m1f8ECZQxHc3PtpxtFtEx1iLu2
         9bHKbw5oXa9mvEYb66TAJA1hyReniIxMTKaTSNaDfz4povwMBoVNhjxRbUEswKQStXCJ
         ZH6Qn4+6OxeMvQ08JKVvSxQE0ZoSfRJLuLU7H2ku3AIbHKJZOL0lw78aRK/CunI7RFtT
         s5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:from:to:cc:subject:in-reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding;
        bh=lUvBH6nr58VB+Bcg9P6b2Cq/IwqGPE/1PVz3hFVWuQ8=;
        b=HYUPwYT4n3eWc4+vxhqn+KFbip1F7DZnqhcIRIo2Pu1mb6yxVhT7o7vJM+MgzX3hHJ
         Pf49ggOjKqGHnf4/gtMCmQQS0s4iydw7cuGs0ozpLYnVWFwEEEWT7ZcMF1dOrQugDtu0
         Lm1fKNJPi4byivSTKEBZxPNudIhWagD3JDnvtTAN0r5OOna3bp5n0SDCphsJw63m7xOf
         8tkLYspCb3fdSPGw0Jk4jqXfJOb61eaDJPFnCCVEpM4p51kWUnYOIHkU7hMdr7cuopzB
         9O8r2DOTrphAfRk8CuNdn8gyvF6pPAo0K64vrr45gj1pw6Dd0RMEIbP9jEdIMakLJq9p
         Y+4w==
X-Gm-Message-State: AOAM533dmG7Tp3ME2Kf/2LsK2RkRIw2XxcCKfRuWuqvip1yR7XmRWm4y
	Lc5KnX7SFz1l+ns5qho9Ze+oKiN+j+8=
X-Google-Smtp-Source: ABdhPJz5hA/Ed6meHaxhWLI8jPUL7u3WXDT/6+Zld4flNmfJzW3L2JJ6Afm3CQuhPvscOmNRXWeMoA==
X-Received: by 2002:a37:6c83:: with SMTP id h125mr10347198qkc.486.1633476665181;
        Tue, 05 Oct 2021 16:31:05 -0700 (PDT)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (bras-base-mtrlpq2848w-grc-41-70-53-240-121.dsl.bell.ca. [70.53.240.121])
        by smtp.gmail.com with ESMTPSA id 6sm10171431qkc.123.2021.10.05.16.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 16:31:04 -0700 (PDT)
Date: Tue, 5 Oct 2021 19:31:04 -0400
Message-ID: <20211005193104.GB3453152@t480s.localdomain>
From: "Vivien Didelot" <vivien.didelot@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [meta-arago][PATCH] qtwebengine: replace patch with chromium flags
In-Reply-To: <20211005225224.GF1528@denix.org>
References: <20211005212507.3301764-1-vdidelot@pbsc.com>
 <20211005225224.GF1528@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Denys,

On Tue, 05 Oct 2021 18:52:24 -0400 Denys Dmytriyenko <denis@denix.org> wrote:
> Hi,
> 
> meta-ti is the wrong mailing list for this patch. Please send it to meta-arago 
> instead.

I subscribed, but I did not receive any confirmation email (yet?). Can you
forward the patch to the meta-arago mailing list in the meantime?


Thanks,

	Vivien
