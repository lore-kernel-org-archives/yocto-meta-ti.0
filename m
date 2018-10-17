Return-Path: <trini@konsulko.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 76C4AE00BBF; Tue, 16 Oct 2018 19:06:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.195 listed in list.dnswl.org]
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0AC14E00B6C
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 19:06:42 -0700 (PDT)
Received: by mail-qt1-f195.google.com with SMTP id l41-v6so28259567qtl.8
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 19:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=niDyHleQFoPgnbACt5j1IDLlXhchq2RA/NDaMsD0KH4=;
	b=OqL76SD8Sg2vu2abbPLsc92xnXy0qGMzxWbxm/on2+bSRxoCwaUVxOl5OY5SUODAVq
	Jpu5IYaqhHvzhH8rjdz3CAPtpeFWnqCX4g559kwxx5E6uSL3Cu/gvrWOu1wMNCMv0Vc+
	K0CrQCV6K6VEctH/fnnh9KjfZbWu1E/w2NCYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=niDyHleQFoPgnbACt5j1IDLlXhchq2RA/NDaMsD0KH4=;
	b=Zd8HhQZvPwJX8V2xPOvtsjpPkaZ8VKXX8QxhY9ho9jiUb33nDZ8+AaqvkeCZdYuEtX
	Fz+zAgLXyKH5mRiVztf7x71i5B21uavoD1s4WvAxx+HQoi3+XECrIZYDKVDHy71QEP9b
	50ehH55QRJHLQX1a8A39xtrdnTGdq4f65O5bbHXT8JGVPrIGVpno/eWxRBB8TLr6YWMM
	Q5wxL6Wz4lK+7QMAmpnXARlxUpNIGlKaGs/sqRaRRiQ7z27Ix3eKka0C+kWSRYWCOCYI
	xe/b5Dyb9TUzXsI6uOygMnPDMKssy4+tWXaql/ZgiJb3k/um0Y4CGA8qIzT4Y2Soehg7
	6veA==
X-Gm-Message-State: ABuFfoiduShwYyoYwdPBonT9g7l6+2h4TrcMadR5SVZMF0DfW3/g1FGg
	yEQNEFZ0ltmYpbj6wrHQm37UeA==
X-Google-Smtp-Source: ACcGV62AnObL6HTtGg6Dbn/ENT4PaxRgGsrbfroitNl52xQoyya3LygN+DEC61ImaspfBstEclYPUw==
X-Received: by 2002:aed:3b97:: with SMTP id
	r23-v6mr22673436qte.77.1539742002291; 
	Tue, 16 Oct 2018 19:06:42 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-133-47.ec.res.rr.com. [65.184.133.47])
	by smtp.gmail.com with ESMTPSA id
	k71-v6sm14597948qkh.30.2018.10.16.19.06.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 19:06:41 -0700 (PDT)
Date: Tue, 16 Oct 2018 22:06:39 -0400
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181017020639.GQ1032@bill-the-cat>
References: <20181017002110.8438-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20181017002110.8438-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH V2] u-boot: reduce the SPL `.rodata' size
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
X-List-Received-Date: Wed, 17 Oct 2018 02:06:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 16, 2018 at 05:21:10PM -0700, Khem Raj wrote:

> Fixes errors e.g.
> 
> | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not fit in region `.sram'
> | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: Denys Dmytriyenko <trini@konsulko.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

