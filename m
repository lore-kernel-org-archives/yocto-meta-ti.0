Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1F72E00746
	for <meta-ti@yoctoproject.org>; Mon, 25 Jun 2012 23:26:34 -0700 (PDT)
Received: by eaab16 with SMTP id b16so1906319eaa.35
	for <meta-ti@yoctoproject.org>; Mon, 25 Jun 2012 23:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Pk/6znOsvKLU8INDjH/2wNTZ/7x+ekrunM6AzoBN9Pg=;
	b=kMtQOjcFA3LZq3ylYwgUQNteCpoE8Cvvu09fMSrUD9U8h58EJQbHg4Xb7qgNLFSSH1
	7jrNFQjz9+jo/XBfjO534AqyVsPxw6RqmYN01kJ9lrVaG8sSioFScq0/QyKDGmZIU2KD
	/DkaIwVw0V+13/PEol8j36o/Pr6ll7B/cIJr5AQ6f95bMhlbKlP2ohkOqPT654fmLdMo
	A8i6egw1xMGFCEgZz6eUdIyp9I6upgCTP4y1OK4pFruZLN2PFTEfrkRiyj6z8bgQDlKy
	aaUaew3PydyVShkQUWBaBBsCnsONmGjWttyRCrL8iZ3nVrb6qJX1WJnRhMbYNv6OSNi+
	uG7Q==
Received: by 10.14.48.65 with SMTP id u41mr2784740eeb.169.1340691993752;
	Mon, 25 Jun 2012 23:26:33 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d965:f9fc:d036:3b35?
	([2001:610:612:0:d965:f9fc:d036:3b35])
	by mx.google.com with ESMTPS id u14sm145570136eem.4.2012.06.25.23.26.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jun 2012 23:26:32 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120626000117.GA11082@edge>
Date: Tue, 26 Jun 2012 08:26:33 +0200
Message-Id: <5E1F862E-2C66-4ADF-A756-B742EABE5D4E@dominion.thruhere.net>
References: <1340607432-27134-1-git-send-email-koen@dominion.thruhere.net>
	<1340607432-27134-3-git-send-email-koen@dominion.thruhere.net>
	<20120626000117.GA11082@edge>
To: Denys Dmytriyenko <denys@ti.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlmFGC71ZsPhXmmL07LFV3/BzKQuk6WfGJrs6E43Gct8eVWQyehWFmTeBKCBdwYu6MxBCAo
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 3/3] linux-ti33x-psp 3.2: update to 3.2.21, add libertas fixes
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
X-List-Received-Date: Tue, 26 Jun 2012 06:26:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 26 jun. 2012, om 02:01 heeft Denys Dmytriyenko het volgende geschreven:

> Thanks, Koen.
> 
> What's the plan to rebase against the latest PSP tree and drop some of the 
> patches?

When time and motivation align :) Or when Joel gets asked to do it :)

