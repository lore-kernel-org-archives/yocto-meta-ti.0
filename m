Return-Path: <raj.khem@gmail.com>
Received: from mail-da0-f44.google.com (mail-da0-f44.google.com
	[209.85.210.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED20EE006AD
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 10:43:26 -0700 (PDT)
Received: by mail-da0-f44.google.com with SMTP id z20so450859dae.3
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 10:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=jaoZkFL8mgIU3hIopwnKwj+LMelU0sYCO1fiWKVgNCs=;
	b=IpAsx5LiWobXgGguvDWtIZTOQiXgYLGXTFWVkEpm15aNG9eFsisCXVjjTaTqQLcXAa
	/J/aHM6Y9ZgUsXSXqKA1sIYvGaoVP8kMZMtSmAQpJeaJ/H93fCJQLwNQzK3N9QrYNXjV
	Z4YiSeBkkdfkYsmUcPkbQ15LDWdyzmC6SLr8XWd1o1YQP7b9r62BlIEAd/7t22rvHpRV
	bwCUasZIypR4mEwtGbZGL5d6NQuxBALcli8sw1ji/VVzzol65/EaRVbA3l5PMed0j/X5
	SH1cR3m2ZWufLF7OfngOBtGVEESOcfdwhfxyCHrOBdMCtHqLHG41jCX2DMKUhC+GmSkN
	TnLw==
X-Received: by 10.68.225.195 with SMTP id rm3mr4295317pbc.188.1363715006758;
	Tue, 19 Mar 2013 10:43:26 -0700 (PDT)
Received: from sa-nc-ipg-172-23-0-104.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id pg7sm25071757pbc.5.2013.03.19.10.43.24
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 19 Mar 2013 10:43:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130319172138.GQ32759@edge>
Date: Tue, 19 Mar 2013 10:43:26 -0700
Message-Id: <ADC047C8-685F-4B2B-9686-00D912FCA66B@gmail.com>
References: <514873B9.3020500@comcast.net> <20130319172138.GQ32759@edge>
To: Denys Dmytriyenko <denys@ti.com>
X-Mailer: Apple Mail (2.1503)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Is this the correct list for AM3517 EVM questions?
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
X-List-Received-Date: Tue, 19 Mar 2013 17:43:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 19, 2013, at 10:21 AM, Denys Dmytriyenko <denys@ti.com> wrote:

> On Tue, Mar 19, 2013 at 10:18:33AM -0400, Steven Grunza wrote:
>> Hello,
>>  I have a LogicPD Zoom AM3517 experimenters board.  Is this the
>> correct list to ask questions about getting Yocto-based software
>> running on this board?
>=20
> Yes, this is one of the correct lists for asking questions about =
AM3517 board=20
> when used with the Yocto Project. :) As this is the mailing list for =
meta-ti,=20
> which is the official Texas Instruments BSP layer for =
OpenEmbedded-Core and=20
> the Yocto Project, and AM3517 is currently one of the supported =
platforms in=20
> meta-ti.

Now question please :)


