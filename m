Return-Path: <ankur.tyagi85@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 48050E00D4A; Thu, 25 Jul 2019 02:27:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (ankur.tyagi85[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.49 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95F2AE00D59
	for <meta-ti@yoctoproject.org>; Thu, 25 Jul 2019 02:27:54 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 62so29144491lfa.8
	for <meta-ti@yoctoproject.org>; Thu, 25 Jul 2019 02:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Raw9cbWoQNk1BGPWa08lEHPsoKOthlRJtrtfOeoXIKI=;
	b=u4f8QNfCKUXsKJZiY6J7KF9rtT/uqDFtiQSFkuUm0fjU54HL2aPGmNnhfr9aFRBq5q
	oZ4MbJRCcGBhCo5twKyOrTdDml0yMydx8UxRki9zHDuaMoSpG2JQRCBYp9yXFBuO9qyb
	hv5o7DMhn5RnA1jY0CIxiR9b0/psgEBbr12CTHvN4SYHh6RmKxRXf7cYeEVKbHZoWPKz
	NdT5gvRgGMbGp/jqSsRzDjwxjL1G4LlQ/EPuiZ7xaFPW40GnBbkNTFTQBSxUXGOth0uc
	sug9QcTeuZNmeUO3J5Tbo7slnDJanLYgvQ9wGrI47pKhQTaStQeM7aMe0OOY4FhomZUp
	Ft6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Raw9cbWoQNk1BGPWa08lEHPsoKOthlRJtrtfOeoXIKI=;
	b=rOGQ0cwMH6N8Ezm4OnWhiKLnD9pidGlOJ9bJQ6IwWdq92cj8ElyudvaHu97U1/L+DS
	B/iuJcecJUHBtAtz7h2HpEIaY8nfCu6EjE5YhWjbi3a/UI9Q646gLJEqcd8Z7i+ZzeYk
	DAKgc0gsOqtFYNQtsUcWsQaSlTGS2Qf1znst8I5PStemMmh+muRvXu8XCTvKRNIMOhYb
	XsTeKFMKY4dtp+BSUycuqVZQRfoIOu+YempZ9JW9oV1RA6iZlu32u/mAsoR5x8Q796Z5
	6xOV/9aYXk93XZPTTdI6P2/GjdLIsB4HmSF07ghHgHJJPRlV1XUSYVGjzL5q8JIE2B4g
	d4Vg==
X-Gm-Message-State: APjAAAXBNlzIQwlSqjp0RQR2oVF3IQP2vxuUKZUwcqV1YxSuY71uLgde
	RdXvIZ7325opemVReUMFZTpv6755FqZrvWXJIP5I1A==
X-Google-Smtp-Source: APXvYqxi3vrSc6z0i9y9fENN5/a/Jg2GXAsgzKPDsx/PgwJ17bsmiq/8em+TfAdIj95NZ1w7g4fOBBWBevNIOyW179U=
X-Received: by 2002:a19:2297:: with SMTP id i145mr40177331lfi.97.1564046873275;
	Thu, 25 Jul 2019 02:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.17419.1563996558.2881.meta-ti@yoctoproject.org>
	<CADySD0FixCQpE-yDVEOySTYvNMs8Gu58K3nvaW-a7gWi2gw_uw@mail.gmail.com>
	<em51dbd303-8bf5-4c7e-81d3-8c671358caaa@andys-imac.local>
In-Reply-To: <em51dbd303-8bf5-4c7e-81d3-8c671358caaa@andys-imac.local>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 25 Jul 2019 21:27:48 +1200
Message-ID: <CADySD0GC6JbKA6hY1b=44rzAVxWa_pZ+SuK77NG5ya_a9vXY5A@mail.gmail.com>
To: Andy Pont <andy.pont@sdcsystems.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Building for AM335x with meta-ti and meta-qt5
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
X-List-Received-Date: Thu, 25 Jul 2019 09:27:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 25, 2019 at 8:49 PM Andy Pont <andy.pont@sdcsystems.com> wrote:
>
> Ankur wrote...
>
> >We have been using Thud release from meta-arago and it builds Qt5.11.3
> >with EGLFS for AM335x.
> >Make sure add DISTRO_FEATURES_remove = "wayland" in your local.conf
> I have got dispensation from our client to use Thud so have checked out
> the appropriate branches for Poky, meta-ti, meta-arago, etc. into a new
> development directory.
>
> What do you have the MACHINE and DISTRO variables set to in your
> local.conf and what image do you bitbake?

MACHINE is custom based on 'am335x-evm' and DISTRO is also custom
based on 'arago'

Regards
Ankur
>
> -Andy.
>
>
>

