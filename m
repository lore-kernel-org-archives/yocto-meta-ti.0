Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C0D98E006C4; Tue, 15 Jul 2014 11:48:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9712DE004FF
	for <meta-ti@yoctoproject.org>; Tue, 15 Jul 2014 11:48:27 -0700 (PDT)
Received: by mail-ie0-f172.google.com with SMTP id lx4so2823422iec.31
	for <meta-ti@yoctoproject.org>; Tue, 15 Jul 2014 11:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=BNlkTZyfvOMJbKyE4/1Frq2whfeGewkYgqOa75cK06M=;
	b=szTg0Nb7tBHHB9mcAP4n2Wqm64TzFaSJLmzlzjq244VPv60ajM+lZJEWDzChMZ6zFt
	26qZ2tPiTfgiWUzqzjX0Z13NTUOqRUzqsV3i7J4P1Youx2Ta0bnrurz4YywHmyJulRo5
	KVMrZQcov1Lp89So8Ri7QHa0WrS0U6qAR5Gli4PME7eZTUPbhkcJAg3ptb8Psu2z3nf5
	kRC0yfaxE7+1oAWMccDZ0rzIcnsvrwbAHQw/NGTdKZEvWs6xreSHz2lN4ydapYMbZVUj
	Rha/Jgp0/+f7TSmUc1I7i672Uu1u7tilKTVZIDIcua1B5S/2ORqo45TH3Qbr7AGZkPLl
	eOnA==
X-Received: by 10.50.43.134 with SMTP id w6mr8957863igl.17.1405450106942; Tue,
	15 Jul 2014 11:48:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Tue, 15 Jul 2014 11:47:56 -0700 (PDT)
In-Reply-To: <20140715184122.GH15788@edge>
References: <53C3F353.2020001@gmail.com>
	<CAMKF1sqn0wYeNHps-0Ss0zotP3cMp-u2iVC1e49Cc8o3HO4OcA@mail.gmail.com>
	<20140715184122.GH15788@edge>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Jul 2014 11:47:56 -0700
Message-ID: <CAMKF1sqCu9qDxwp2NCooiYw7JiBkPvQ1ESMrqsNtdOgG12ejOg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [daisy] missing network adapter options in omap2plus_defconfig
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
X-List-Received-Date: Tue, 15 Jul 2014 18:48:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2014 at 11:41 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Tue, Jul 15, 2014 at 11:34:31AM -0700, Khem Raj wrote:
>> On Mon, Jul 14, 2014 at 8:12 AM, Miroslav Ke=C5=A1 <miroslav.kes@gmail.c=
om> wrote:
>> >
>> > Neverthelles, the kernel config pulled by
>> > meta-ti/recipes-kernel/linux/linux-mainline/defconfig refers the
>> > omap2plus_defconfig which doesn't set the CONFIG_USB_EHCI_HCD option.
>>
>> inform or send a patch to meta-ti
>
> This is meta-ti mailing list already...

yes it is. this was unedited response

>
> --
> Denys

