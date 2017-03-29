Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E8F1AE006CD; Tue, 28 Mar 2017 23:08:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.170 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 202E3E00546
	for <meta-ti@yoctoproject.org>; Tue, 28 Mar 2017 23:08:04 -0700 (PDT)
Received: by mail-wr0-f170.google.com with SMTP id l43so3396312wre.1
	for <meta-ti@yoctoproject.org>; Tue, 28 Mar 2017 23:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+8EDFSWed4Llzo/JoplgBfhfB4jKlGcKNdx1RFgGtzM=;
	b=cuR4Ev4JHXb1cmxU43yqTUlt0W6PQrHOJcClCdzp+GnVGyJH5kFzGgdQgkvBhzELHM
	sz+pw5vSOfM3TH7LhSKPWdt3FDh1w3EALjSTtBoPX466HNgzc3WooGADGvTcck56PNyt
	u5TgUKApz5C1gB/O82pf5ccAJyzqIroe2LLzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+8EDFSWed4Llzo/JoplgBfhfB4jKlGcKNdx1RFgGtzM=;
	b=WlliogHU+Pu7NaZVzgsYDzY97Q/jsgospkNOdVMDGijD11JJv6/WOFp9kh7O73OoLg
	v7SQDNal6Dm60GgWcmBixgOw5FMkhQMZSrq6o+6hKC54VCZwv4jxa/RITq7V1ogXiZpW
	/y3LASQ2c+wKMikHfERG9YbzgZwdvtBM8uYqgwAzpy5tYMh7GoavwvZE4gOKn64Rpe2U
	RTBdvqWr88is1n/Vkcdz/c9cBQa8uIucW+uYt+HTNQjq1rNHvPExgSay001j37hR5MPD
	LUv1Xl8ylL1Z+G6qnqUOKpFcZc3lozFPyZMkAsHHIcFtPzCdqtqi1O0hT4QXlFN/teU7
	eARg==
X-Gm-Message-State: AFeK/H077OiWzLFbLRYu+aVJ3BZVtdE9Evee/PNFf5OpXo4qsqJz++ZSly4yNn6IGtOzTEES+a5IP/vIvJKzMpaO
X-Received: by 10.223.161.207 with SMTP id v15mr11860500wrv.71.1490767683827; 
	Tue, 28 Mar 2017 23:08:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.13.1 with HTTP; Tue, 28 Mar 2017 23:08:03 -0700 (PDT)
In-Reply-To: <20170328225142.GQ29187@edge>
References: <20170328092842.7327-1-fathi.boudra@linaro.org>
	<20170328225142.GQ29187@edge>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Wed, 29 Mar 2017 09:08:03 +0300
Message-ID: <CAGNsrLB++KiN-Ae3R59+LzCmzPzD4soqmioQX=je+DC11heaRw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] kselftests: update to 4.10
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
X-List-Received-Date: Wed, 29 Mar 2017 06:08:07 -0000
Content-Type: text/plain; charset=UTF-8

On 29 March 2017 at 01:51, Denys Dmytriyenko <denys@ti.com> wrote:
> Fathi,
>
> Did you forget to include the individual Makefile patches here?

sorry, I missed git add ...

Fixed in v3 and also fixed 2 additional issues:
 * Add sudo to vm package RDEPENDS.
 * Add ipc package on Aarch64.

