Return-Path: <tom.rini@gmail.com>
Received: from mail-qy0-f176.google.com (mail-qy0-f176.google.com
	[209.85.216.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D167CE00307
	for <meta-ti@yoctoproject.org>; Fri,  4 Nov 2011 12:46:42 -0700 (PDT)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by qyk29 with SMTP id 29so3552953qyk.14
	for <meta-ti@yoctoproject.org>; Fri, 04 Nov 2011 12:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GLGbaZd7tK7gAZcRnRgoGdd7xzShWeDVcH7PWL1PrzM=;
	b=Mi9m2+CbLQK699qu8oit31ketgHatdYVVHKYBJf5GYzBztQfrasnmstRP++FGaxRss
	9uy090zP8cgBPVwH83G+C3y9jAdgdYhsRyVYKcmVmRQ/pLSn8cLOp+vkHOQLqYolGGdM
	paw48E6nPdOCivnSCn6JRbETo8qV+cVoGftLo=
MIME-Version: 1.0
Received: by 10.229.64.153 with SMTP id e25mr2104597qci.74.1320436000937; Fri,
	04 Nov 2011 12:46:40 -0700 (PDT)
Received: by 10.229.94.72 with HTTP; Fri, 4 Nov 2011 12:46:40 -0700 (PDT)
In-Reply-To: <1320434764-17119-1-git-send-email-joelagnel@ti.com>
References: <1320434764-17119-1-git-send-email-joelagnel@ti.com>
Date: Fri, 4 Nov 2011 12:46:40 -0700
Message-ID: <CA+M6bX=4J-U=x5+G18AtWgPvapxGMU03grQthb7FsGfX1xMXJw@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Joel A Fernandes <joelagnel@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] U-boot 2011.10rc: Refresh PMIC patch with Rev A1 fixes
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Nov 2011 19:46:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 4, 2011 at 12:26 PM, Joel A Fernandes <joelagnel@ti.com> wrote:
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>

Acked-by: Tom Rini <trini@ti.com>

-- 
Tom

