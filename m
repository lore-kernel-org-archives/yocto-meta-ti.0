Return-Path: <nicolas.dechesne@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D3B04E007B5; Tue,  5 Aug 2014 09:37:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.218.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D259E0030B
	for <meta-ti@yoctoproject.org>; Tue,  5 Aug 2014 09:37:27 -0700 (PDT)
Received: by mail-oi0-f48.google.com with SMTP id h136so789665oig.7
	for <meta-ti@yoctoproject.org>; Tue, 05 Aug 2014 09:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=biFnpr5mRd+ZSLFwyJ431r3ZlnTZ4ZmCgQOV1wovtBY=;
	b=TsEgtXsVKtKr06rpTQT7xO3S50EsWW2W8iGGeDpKrlkLuZ5iXoP2LrNBLQje8xuHQl
	PgICM4NgMYHqPmLgnUiQhp263vEdAL53OtN6Fwc3KjZHeXkreMFcPShOQHpB0L5uKHws
	7UAQioI+3Ql3C0S6WSJNL6VBksBBuj6gkVOIbrcw1+55Qwggfh0jYBSS3k9DFfe8rChK
	dIqUdRCtV0T5k0IPUvsjmIVDagwoV8yXF6qFafYRKcvTPWsW4iSm0CZcC9dD4Svoyqoh
	iWVMZjAC6w4uiyhNNKoJ4CxGcG8fAL3AqvBEcZK70cfw94STxUK4btVwrm4wlSmoLpI4
	r1MA==
X-Gm-Message-State: ALoCoQntSzx1OO4grFzNQYKaNT2sZSRwtq6Sv2IswdGDcaMZwDhx+AsweNq7FGtdi3pNfSbqDuc0
X-Received: by 10.182.143.67 with SMTP id sc3mr7307333obb.76.1407256646615;
	Tue, 05 Aug 2014 09:37:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.171.168 with HTTP; Tue, 5 Aug 2014 09:37:06 -0700 (PDT)
In-Reply-To: <20140805022929.GB23523@edge>
References: <1406684113-18232-1-git-send-email-denis@denix.org>
	<CAP71WjwdFhrz=c-RJHyte7vLRVSex1DxBX=4nR7DHJVHY64BXA@mail.gmail.com>
	<20140805002000.GB2572@denix.org> <20140805022236.GA3867@haswell>
	<20140805022929.GB23523@edge>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 5 Aug 2014 18:37:06 +0200
Message-ID: <CAP71Wjwi6eeXX5f+zLwNSfoE0BtAZbFRFWWoJnmgpy837=ofww@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] linux-ti-staging: add Darren's SGX patches to make graphics work with 3.14
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
X-List-Received-Date: Tue, 05 Aug 2014 16:37:33 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 5, 2014 at 4:29 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> Ok, will try to remember next time :)
>
> Which SoC are you guys using?

i am using BBB. i was just surprised to see the sudden (unnotified)
change. so i though it might have been a typo.. no real issue. it
would have been nicer to see it in the log, indeed.

