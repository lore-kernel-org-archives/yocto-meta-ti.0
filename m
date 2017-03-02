Return-Path: <kergoth@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 43BAEE0093F; Thu,  2 Mar 2017 11:29:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (kergoth[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.170 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.170 listed in list.dnswl.org]
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com
	[74.125.82.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2793FE0049D
	for <meta-ti@yoctoproject.org>; Thu,  2 Mar 2017 11:29:40 -0800 (PST)
Received: by mail-ot0-f170.google.com with SMTP id x37so14772902ota.2
	for <meta-ti@yoctoproject.org>; Thu, 02 Mar 2017 11:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K1lnAJVmv11ow1eMXDVYQazCnbSi8S/SbbOzh/RRbDk=;
	b=ExRQEqNVEUVZ6qZ5EJh7KlEzjQnBIgs7VjR6AbwsMpi3ELnSSw9X/T7QR2ikn7vCv1
	LcR7ACWYKwC6K+z1XBVRU2mFlIg+t+Ghaxw5BWd2EMB5jmf752woFUENizWYSTEYOeha
	o5lhLEDZdKhwibYC6cZI4Hv3wf7FZ0+i/yo2dKlrh5YRnsfIaUXQI7W/mKty0e4U7p3k
	oMdro2NeD5BZ04PECWhhV0G4buKA0aVzZoJdoWgnxZ3JgrLBnfJclq7LjT3XrCzFbx21
	0D5p+gyvAi5fpGNG5EAGwyOfcwbYhPaMUdpRN/fdrqupI4v5E9T29HPjQTU7vl/ZqxDv
	/IBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K1lnAJVmv11ow1eMXDVYQazCnbSi8S/SbbOzh/RRbDk=;
	b=PaJHQtoP0KEsJSiePeMFVblREkewYV7NWReeDwjx+k3MqtFYqYA0i5FTskDJvpdWRO
	7LN9TlomiY/Ijw3zWJVRmqPQOlQWpA84G1lh2dTLDsjZ/xjupDmMF+ImHyFvd8K+c0NA
	C70yMfLnbAyM4mhmk0rDAuILZdJW+RsQvVtaCNG6xXFMUllBEkkF/qw9hNO3lC+k8Nm3
	Dnioa/2JDt8cTd879pE4fZ/ylHh+D9XmMQd+nJFiJ/0EBzvK5jljwUzWSRQdKQbqgnJw
	4XyyLGpA4VzaHm2iKvTl1rwS64xvka/Pz2SVDcMkuj8kBxG8db7IOJdpj4XayLnZtW4j
	+omg==
X-Gm-Message-State: AMke39nPZO8OUmoMSk8q40DDHKtObwun06occMitOIDL9pTqdEAS27Xoy4nAlE/0pfoi1VO4DkV5iV4SAB5eug==
X-Received: by 10.157.4.37 with SMTP id 34mr7064872otc.205.1488482979929; Thu,
	02 Mar 2017 11:29:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.32.97 with HTTP; Thu, 2 Mar 2017 11:29:19 -0800 (PST)
In-Reply-To: <20170302171336.GQ12614@edge>
References: <1488443615-2456-1-git-send-email-gary@mlbassoc.com>
	<20170302171336.GQ12614@edge>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 2 Mar 2017 12:29:19 -0700
Message-ID: <CABcZANmnRZA9k1XsqcjyE1mjTUzE_-HmFFFt_vmG-qKy4Ggbqw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>,
	Gary Thomas <gary@mlbassoc.com>
Subject: Re: [PATCH] beaglebone.inc: Update use of obsolete bitbake API
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
X-List-Received-Date: Thu, 02 Mar 2017 19:29:44 -0000
Content-Type: multipart/alternative; boundary=001a113724cc45e59d0549c47303

--001a113724cc45e59d0549c47303
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 2, 2017 at 10:13 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> Ah, right, I forgot about this API change when pushing to master... Thank=
s.


As an FYI, this check should really be moved to an event handler. As it is,
if you have meta-yocto-bsp in bblayers, it=E2=80=99ll show an error for eac=
h and
every recipe that was parsed, not particularly friendly. I=E2=80=99ll submi=
t a
patch when I can find a moment.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a113724cc45e59d0549c47303
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Mar 2, 2017 at 10:13 AM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Ah, right, I forgot about this AP=
I change when pushing to master... Thanks.</blockquote></div><br>As an FYI,=
 this check should really be moved to an event handler. As it is, if you ha=
ve meta-yocto-bsp in bblayers, it=E2=80=99ll show an error for each and eve=
ry recipe that was parsed, not particularly friendly. I=E2=80=99ll submit a=
 patch when I can find a moment.<br>-- <br><div class=3D"gmail_signature" d=
ata-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Ch=
ristopher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbe=
dded, OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></=
div></div>
</div></div>

--001a113724cc45e59d0549c47303--
