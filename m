Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vb0-f47.google.com (mail-vb0-f47.google.com
	[209.85.212.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCC87E014E0
	for <meta-ti@yoctoproject.org>; Thu,  2 May 2013 06:53:17 -0700 (PDT)
Received: by mail-vb0-f47.google.com with SMTP id x14so466321vbb.34
	for <meta-ti@yoctoproject.org>; Thu, 02 May 2013 06:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=7gIpjlksOPTQdsKcA3jM9wHfQbiUZyo6uB8C9x88ySo=;
	b=IfLEKaIaiJxq4f0IRieilS9PQtS6hkpYBD0kuU8+evsPaXAiBQcQHlASn8lnuFhWzZ
	dQ/NO35Eambpj8cng1gT7PX0b/TuFQquM8/zFs43tS/hEN/l1ZVDDmiLihrdRwc3INdM
	CXsGSrT/io7iZbOxt0VezvlwYPnUZ4CEPzvKxdgeMxRNsRe+GLLJqHaaofZ/Ea1Mepnx
	2QY8DHo04jDA77gTu+QblaQ/MB5NwlPOzSR+pZHstngWY71p74A+rDqxZL/BUijE7dYo
	j+EKCOI7js0/6+vPusqaxyyzAU6aY/siTV/nb2MR8iSXPCXHshwLw9Svc2u3nDIMWWlL
	fXKQ==
MIME-Version: 1.0
X-Received: by 10.52.69.109 with SMTP id d13mr1842490vdu.75.1367502796311;
	Thu, 02 May 2013 06:53:16 -0700 (PDT)
Received: by 10.52.139.33 with HTTP; Thu, 2 May 2013 06:53:16 -0700 (PDT)
In-Reply-To: <1367501964-6294-3-git-send-email-prabu@ti.com>
References: <1367501964-6294-1-git-send-email-prabu@ti.com>
	<1367501964-6294-3-git-send-email-prabu@ti.com>
Date: Thu, 2 May 2013 15:53:16 +0200
Message-ID: <CALbNGRRs=v0_ZGTVvDK3FwkgYGsAXOF1qLK57mAvOERGXea=2g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Prabindh Sundareson <prabu@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 03/10] libgles-omap3: Remove unsupported core build option ES2.0
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
X-List-Received-Date: Thu, 02 May 2013 13:53:18 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 2, 2013 at 3:39 PM, Prabindh Sundareson <prabu@ti.com> wrote:
> ES2.0 build option for SGX user binaries is deprecated as the
> corresponding SOC is no longer in production
Does this mean end of support for this hardware?

Andreas

