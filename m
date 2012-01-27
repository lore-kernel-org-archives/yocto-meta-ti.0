Return-Path: <tom.rini@gmail.com>
Received: from mail-qw0-f48.google.com (mail-qw0-f48.google.com
	[209.85.216.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0EF43E0072A
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:10:22 -0800 (PST)
Received: by qauh8 with SMTP id h8so622006qau.14
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=YOpNmjHVEs698WJtwbSpmlobVBanNkku45tle2fLE2Q=;
	b=f/PJO8JGxID7yNH6/3Q92AcZnbeZgDFT1s8PBmWRMF3qaqweMWvj1R8bdxLatSIEqI
	zVPLhNvlVZl3FsUSEHGYbRlZ6inAYuoZjq55XkGKN6kSC2dGRhiQZ6FkeGszbbQN3bqH
	zH64ARksGs68P6DEqe6u/QS980E2Gn1D+6QRc=
MIME-Version: 1.0
Received: by 10.224.116.6 with SMTP id k6mr2724162qaq.91.1327695022189; Fri,
	27 Jan 2012 12:10:22 -0800 (PST)
Received: by 10.229.98.149 with HTTP; Fri, 27 Jan 2012 12:10:22 -0800 (PST)
In-Reply-To: <4F2302F8.1000307@ti.com>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
	<4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
	<4F22E41B.8070708@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
	<4F2302F8.1000307@ti.com>
Date: Fri, 27 Jan 2012 13:10:22 -0700
Message-ID: <CA+M6bXkiXcO7EJ2wzwX1ROte8PhJfz2_12s1pDy8aUi+FTWPPw@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: William Mills <wmills@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/3] matrix-gui-browser: port from arago overlay
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
X-List-Received-Date: Fri, 27 Jan 2012 20:10:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2012 at 1:03 PM, William Mills <wmills@ti.com> wrote:
> OK this part is off list.
>
> Go look at meta-intel and then look at the meta-ti your guys are purposin=
g.
> =A0 Now, your an engineer in a hurry and you need to choose between intel=
 ATOM
> and TI ARM. =A0Which one looks simpler, clearer, and well organized. =A0W=
hich do
> you want to use?

The problem we have here is that one of them (meta-intel) is "just use
poky and this" and one of them is "just use angstrom and meta-oe and
this".  And we need to figure out which use cases we want to support,
and how.

--=20
Tom

