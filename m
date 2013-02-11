Return-Path: <ndec13@gmail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id A0152E0027C
	for <meta-ti@yoctoproject.org>; Mon, 11 Feb 2013 11:58:29 -0800 (PST)
Received: by mail-vc0-f170.google.com with SMTP id p16so4039388vcq.15
	for <meta-ti@yoctoproject.org>; Mon, 11 Feb 2013 11:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=9OK5iT8XshP3pDuBJc1NysxsspBbB0gl/P61Tc0Qfao=;
	b=yZrk5WxLI6gmV/Fe/+iNVKUGIQVIz23Vg50r/yJE4FcrMbgnQU2/qVcQf+vjJWBq7t
	Ux7FRC1RH7h7PXtFQzVhkil4lU6NlyYbI2qtsjwhEdaTlPOstecpPVh/t3BWgYUTiVFT
	2aQTG28llDL6hRX4eT7VaLh0seC17T/mXnJOXrVGRlA8t5fGr/s7a0H/79OvGrEFZsKt
	sVjLQEO0dC/LXLGCI/+SnMlTvwvc7K9DS6H7aWxVsZ9PagtC1WiyX50Eucgnm/4crGBF
	bOhYA6oKr0V1sHrG8d70Sizde8fAu3VKyD9hQSy5BM/8UM9+ewQ2NiVnt8JK1svIFymr
	phzA==
X-Received: by 10.52.24.98 with SMTP id t2mr17720233vdf.69.1360612708423; Mon,
	11 Feb 2013 11:58:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.251.98 with HTTP; Mon, 11 Feb 2013 11:58:08 -0800 (PST)
In-Reply-To: <CACMnT39zosRxQfXXoQ8Pbwwtqa2GzKqyqWj2bgU23u4SwM_ypQ@mail.gmail.com>
References: <CACMnT39zosRxQfXXoQ8Pbwwtqa2GzKqyqWj2bgU23u4SwM_ypQ@mail.gmail.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Mon, 11 Feb 2013 20:58:08 +0100
Message-ID: <CAOT3miKb1nEMwp03OGnyDV31O5NAWvZKiZSj7piyVJf-jQhLEg@mail.gmail.com>
To: Jesse Dannenbring <jtdannenbring@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Error building after "mesa-dri update to 9.0.1"
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
X-List-Received-Date: Mon, 11 Feb 2013 19:58:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 25, 2013 at 11:51 PM, Jesse Dannenbring
<jtdannenbring@gmail.com> wrote:
> I previously was building meta-ti without issue but I repeated the process
> recently and found that the patch on 2013-01-10 broke my build:
>
> bitbake -c fetchall core-image-minimal
> Pseudo is not present but is required, building this first before the main
> build
> Parsing recipes: 100% |#########################################| Time:
> 00:02:54
> Parsing of 891 .bb files complete (0 cached, 891 parsed). 1197 targets, 64
> skipped, 7 masked, 0 errors.
> ERROR: No recipes available for:
>
> /home/jesse/yocto/poky-danny-8.0/meta-ti/recipes-graphics/mesa/mesa-dri_9.0.1.bbappend
> ERROR: Command execution failed: Exited with 1

you are probably using meta-ti/master with poky/danny branch, which is
not expected to work. if you want to use danny, then use 'danny'
branch from meta-ti too.

nicolas

