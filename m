Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 774A1E0044A
	for <meta-ti@yoctoproject.org>; Mon, 11 Jun 2012 22:53:42 -0700 (PDT)
Received: by wibhm6 with SMTP id hm6so3084727wib.11
	for <meta-ti@yoctoproject.org>; Mon, 11 Jun 2012 22:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=RdthxXpCc7ExbHtph82egmjP6euOpNpL3x8WhA9Oqfg=;
	b=A9CkHQu5IYKhDrIEJaowX9AVgJCdppy65Ycp6bUaBL3L7hOpFJeI5eVWb7Ktkt7bfT
	7Frwef59Y66/mwSCymmQsvVOvSAn3Pqb+eccNIU8JPjg6umObQQqJiBm49cAhnIL0ktz
	aOHXsWHj/gdeu/ncRuW629DZ85DSGGKQJxd8L/l1RzEmMLv1ZPe250IfrAM80VrdONhM
	p+XUyf6zlkPcEtgvfjIWX2wA5BzNVcsANXEgdcnY8S2kilfAzZcLA8s9Yaq4/I199kGD
	FcHAo0HlB53vZAoBkrqPA76ecWz9N/HA3Zy0LunmYw9sDUxNjd0m77m4Q4Jz6rXLmB34
	N2hQ==
Received: by 10.216.145.13 with SMTP id o13mr7759363wej.95.1339480421187;
	Mon, 11 Jun 2012 22:53:41 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (zk223.dresearch-fe.de.
	[217.92.177.116])
	by mx.google.com with ESMTPS id eb8sm3444482wib.11.2012.06.11.22.53.39
	(version=SSLv3 cipher=OTHER); Mon, 11 Jun 2012 22:53:39 -0700 (PDT)
Message-ID: <4FD6D961.6030905@dresearch-fe.de>
Date: Tue, 12 Jun 2012 07:53:37 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120427 Thunderbird/12.0.1
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <4FD5FD69.8030604@dresearch-fe.de>
	<20120611212503.GB30300@denix.org>
In-Reply-To: <20120611212503.GB30300@denix.org>
X-Enigmail-Version: 1.4.2
X-Gm-Message-State: ALoCoQmwtI2dXlhPYaOQ1tYekVL3zQAKF4B49IsIjY0XEpIQL9JJ2nBka14JIvBtLCABhytEkAvp
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Tracking of Texas Instruments DM81xx related bugs
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
X-List-Received-Date: Tue, 12 Jun 2012 05:53:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Denys!

On 11.06.2012 23:25, Denys Dmytriyenko wrote:
> On Mon, Jun 11, 2012 at 04:15:05PM +0200, Steffen Sledz wrote:
>> Because Texas Instruments is not able or willing to provide a useful issue 
>> tracker (not even for commercial customers like our company) we decided to 
> 
> Steffen,
> 
> That is because meta-ti is not a Customer Support channel. If you, as a 
> commercial customer, have issues with TI products, please use one of the many 
> means of contacting the official TI Customer Support:
> http://www.ti.com/general/docs/dsnsuprt.tsp

We tried all these other channels for half a year. We reported problems via the TI e2e forum, via our TI FAE, via our distributor. We met the TI guys at the Embedded World in Nürnberg (hi Roger!).

Without any success! All we have is a switch device we sent to TI UK to reproduce a bug, which they forwarded somewhere to India, and we've never seen it again. :(

This public issue tracker is our last hope to get help from TI and the community.

> On the other hand, meta-ti is a community project to integrate existing 
> components for TI "Embedded Processor" platforms into a BSP layer for 
> OpenEmbedded-Core and Yocto Projects.

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

