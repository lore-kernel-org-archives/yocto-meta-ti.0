Return-Path: <b.hutchman@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ACCD8E0044D
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 18:20:25 -0800 (PST)
Received: by bkcji17 with SMTP id ji17so5519320bkc.35
	for <meta-ti@yoctoproject.org>; Mon, 05 Mar 2012 18:20:24 -0800 (PST)
Received-SPF: pass (google.com: domain of b.hutchman@gmail.com designates
	10.204.156.217 as permitted sender) client-ip=10.204.156.217; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of b.hutchman@gmail.com
	designates 10.204.156.217 as permitted sender)
	smtp.mail=b.hutchman@gmail.com;
	dkim=pass header.i=b.hutchman@gmail.com
Received: from mr.google.com ([10.204.156.217])
	by 10.204.156.217 with SMTP id y25mr11921295bkw.22.1331000424666
	(num_hops = 1); Mon, 05 Mar 2012 18:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HWaK3HI52xKY1rd1jlsh090QZ1vDxus843bN/96o5l0=;
	b=uk4hHSe4+e+p1WYuemysQdziUUU5a/9W3yEPdeYqFpvBngXYhZWlRajq47cjSMgg/X
	Y7fPPda6qhpZmNROegalxRoHQ66i8NLbnjQYfkuawrZoSSaOTktwo/t1ExIBIFrUL/LS
	YeJmgFR+BZufRAdovosGPk5C3YG+kjpFwkwxopUAOeM01js2gSBjoBMxV2GZPdCXLs5P
	aGpdg7wCEzXi3TK5iwew7S0YMyTwdU+C4lop7ea6Ynw42gGQXQKyjaW4jB/e1FmdzYfN
	9cxrX53r3rjB2A0bdTSCxtGCZkH8PgbPm6LBOJ4eilyGttyZWFyeUTpcgyxmPH8ck+VO
	sDjQ==
MIME-Version: 1.0
Received: by 10.204.156.217 with SMTP id y25mr9409407bkw.22.1331000424549;
	Mon, 05 Mar 2012 18:20:24 -0800 (PST)
Received: by 10.204.229.198 with HTTP; Mon, 5 Mar 2012 18:20:24 -0800 (PST)
In-Reply-To: <20120306013918.GG2030@denix.org>
References: <alpine.DEB.2.02.1203050730440.30632@oneiric>
	<EF446FF9DAC93B479C74AB9153DE173F0C2806AF@SMUCM08V.europe.bmw.corp>
	<alpine.DEB.2.02.1203051138060.14598@oneiric>
	<4F54ED21.9000208@mlbassoc.com> <20120305165844.GE14417@denix.org>
	<alpine.DEB.2.02.1203051212100.15878@oneiric>
	<AD1E46F4-9CEA-4FBA-AB1C-255FCD2E258A@dominion.thruhere.net>
	<20120305202945.GA2030@denix.org>
	<6BE145D6-6354-43CA-A8E9-4F06F92B8D7C@dominion.thruhere.net>
	<20120305222833.GC2030@denix.org> <20120306013918.GG2030@denix.org>
Date: Mon, 5 Mar 2012 21:20:24 -0500
Message-ID: <CAFZh4h_7iSO2v21mczF9CZ-FZViF2vZs3x4bj2wK9dKU7_W_ng@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: Building Yocto for Pandaboard
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
X-List-Received-Date: Tue, 06 Mar 2012 02:20:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 5, 2012 at 8:39 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> I'd wait for now for any other confirmations or onjections before pushing it
> to meta-ti master. Thanks.
>

I'm trying to follow all this and translate it to Netra (I know,
probably big mistake) since I don't have Panda.  I'm on Debian too.

B

