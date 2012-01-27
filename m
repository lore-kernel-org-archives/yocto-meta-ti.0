Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-lpp01m010-f48.google.com (mail-lpp01m010-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 327BBE00592
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 04:09:53 -0800 (PST)
Received: by lagz14 with SMTP id z14so1264255lag.35
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 04:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=/I5NQ28rmuROxmOujLgEMeaz82cVp+nhlc05JWP+zhc=;
	b=XhvNj1tSdlbusFv4JwcBx1hDI1DGzKGxqsXSqYLzG0grR7Y3c55cxOaf6QKyQ7cC81
	ybUQVZU4N/jwnLC7mg8kqUq7L7Z3V0nMISlVpg7dSm9dqRaUDoNvYf3JNGZthT2YWpJj
	j/jEKylTwL9Q4jXQbHp48fwwwvX2kyLzNaikc=
MIME-Version: 1.0
Received: by 10.152.132.104 with SMTP id ot8mr3432252lab.17.1327666191311;
	Fri, 27 Jan 2012 04:09:51 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Fri, 27 Jan 2012 04:09:51 -0800 (PST)
In-Reply-To: <27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
	<4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
Date: Fri, 27 Jan 2012 13:09:51 +0100
Message-ID: <CALbNGRTQSj696KijHn+UU45e9Z+-JhWW5FUv0GUx724PgfzpZA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
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
X-List-Received-Date: Fri, 27 Jan 2012 12:09:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2012 at 12:50 PM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> Since meta-arago is supposed to be as empty as possible and matrix doesn'=
t play well with others it's a bad fit for both meta-arago and meta-oe. May=
be we should split the meta-ti repo into 2 layers: one for BSP things (incl=
uding sgx, dsp, etc) and one for 'sdk' things (matrix).
> The idea is to keep reusable TI deliverables together without forcing peo=
ple to use arago. Putting matrix in meta-arago would mean you can only use =
it with DISTRO=3Darago, which is a huge step backwards from the current sit=
uation.
>
I think splitting out BSP into an own layer is a good idea and sorry
for another hijacking: This would be a good chance to make it
independent of angstrom ( e.g ti-hw-bringup ).

Andreas

